class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # クイック入力用に@postを作成
    @post = Post.new

    # 「今月の収支」用
    d = Date.today
    @syunyu = current_user.posts.where(date: d.in_time_zone.all_month).where(category1: 4).sum(:price)
    @shisyutu = current_user.posts.where(date: d.in_time_zone.all_month).where(category1: [1..3]).sum(:price)
    @syushi = @syunyu - @shisyutu

    # 画面下部の「今月のカレンダー」用
    @posts = current_user.posts.where(date: d.in_time_zone.all_month)

    # 今月の収入が登録されていないときに、登録を進めるモーダルを表示する
    if session[:modal] == nil and @syunyu == 0
      session[:modal] = "true"
    else
      session[:modal] = "false"
    end
  end

  def modal
    # モーダルはログイン時のみ表示する。ユーザーが登録せずモーダルを消した場合は表示をセッションを使ってOFFにする
    session[:modal] = "false"
  end

  def create
    post = current_user.posts.new(post_params)
    
    if post.save
      redirect_to "/posts/note?date=#{post[:date]}", notice: "投稿を保存しました。"
    else
      redirect_to "/posts/note"
    end
  end

  def edit
  end

  def update
    @post.update!(post_params)
    redirect_to "/posts/note?date=#{@post.date}}", notice: "投稿を更新しました。"
  end

  def destroy
    @post.destroy
    redirect_to "/posts/note?date=#{@post[:date]}", notice: "投稿を削除しました。"
  end


  def month
    # 表示する月を指定
    @d = Date.parse(params[:date])
    # 指定月の投稿内容を取得
    @posts = current_user.posts.where(date: @d.in_time_zone.all_month)

    # category1:大カテゴリー　@category2:小カテゴリー　@labels:小カテゴリーの日本語
    category1 = [:seikatuhi, :tokubetusisyutu, :koteihi]
    @category2 = [:syokuhi, :nitiyouhin, :ihuku, :goraku, :koutuu, :kyouyou, :iryou, :kousai, :sonota_1, :tokubetusisyutu, :juukyo, :denki, :gasu, :suidou, :tuusin, :keitai, :kyuuryou, :sonota_2]
    @labels = ["食費", "日用品", "衣服・美容費", "娯楽費", "交通費", "教養費", "医療費", "交際費", "その他", "特別支出", "住居費", "電気代", "ガス代", "水道代", "通信・電話代", "携帯電話代"]


    # 大カテゴリーごとの合計金額を計算
    @bigcate_sum = {}
    category1.each_with_index do |cate, i|
      @bigcate_sum[cate] = @posts.where(category1: i+1).sum(:price).to_i
    end
    

    # 小カテゴリーごとの合計金額を計算
    @goukei = {}
    @category2.each_with_index do |cate, i|
      if i == 9 #特別支出のみ小カテゴリーでなく大カテゴリー単位での合計金額が必要なため
        @goukei[cate] = @bigcate_sum[:tokubetusisyutu]
        next
      end
      @goukei[cate] = @posts.where(category2: i+1).sum(:price).to_i
    end

    # 特別収入と特別支出は合計金額でなく個別金額が必要なため、別で定義する
    @tokubetus    = @posts.where(category2: 10)
    @sonota_2s    = @posts.where(category2: 18)

  end



  def year
    # 現在の日付を取得。これを基準に過去6ヶ月の内容を取得する
    @baseday = Date.today


    # category1:大カテゴリー　@category2:小カテゴリー　@labels:小カテゴリーの日本語
    category1 = [:seikatuhi, :tokubetusisyutu, :koteihi]
    @category2 = [:syokuhi, :nitiyouhin, :ihuku, :goraku, :koutuu, :kyouyou, :iryou, :kousai, :sonota_1, :tokubetusisyutu, :juukyo, :denki, :gasu, :suidou, :tuusin, :keitai, :kyuuryou, :sonota_2]
    @labels = ["食費", "日用品", "衣服・美容費", "娯楽費", "交通費", "教養費", "医療費", "交際費", "その他", "特別支出", "住居費", "電気代", "ガス代", "水道代", "通信・電話代", "携帯電話代"]


    # 配列に過去6ヶ月分のデータ（各カテゴリーごとの合計金額のみ）を登録。　@each_month_data[?] → ?ヶ月前のデータ
    @each_month_data = []
    6.times do |i|
      category_sum = {}
      # 1ヶ月分のpostを取得
      month_posts = current_user.posts.where(date: @baseday.prev_month(i).in_time_zone.all_month)


      # 小カテゴリーごとに分けて合計金額を計算
      @category2.each_with_index do |cate, i|
        if i == 9 #特別支出のみ小カテゴリーでなく大カテゴリー単位での合計金額が必要なため
          category_sum[cate] = month_posts.where(category1: 2).sum(:price).to_i
          next
        end
        category_sum[cate] = month_posts.where(category2: i+1).sum(:price).to_i
      end

      # 総収入と総支出
      category_sum[:sousyunyu]  = month_posts.where(category1: 4).sum(:price).to_i
      category_sum[:sousisyutu] = month_posts.where(category1: [1..3]).sum(:price).to_i

      @each_month_data << category_sum
    end
  end



  def note
    # 入力モーダル用に@postを作成
    @post = Post.new

    if params[:date]
      d = Date.parse(params[:date])
    else
      d = Date.today
    end

    # 指定の日付の含まれた週の日付を曜日ごとに取得
    if d.sunday?
      @monday = d - 6
    else
      @monday = d - (d.wday - 1)
    end
    @tuesday = (@monday + 1)
    @wednesday = (@monday + 2)
    @thursday = (@monday + 3)
    @friday = (@monday + 4)
    @saturday = (@monday + 5)
    @sunday = (@monday + 6)

    # 各日の日付で登録されている投稿内容をすべて取得。この内容をビューで@mon[0],@mon[1]と順番に使用する。
    @mon = current_user.posts.where(date: @monday)
    @tue = current_user.posts.where(date: @tuesday)
    @wed = current_user.posts.where(date: @wednesday)
    @thu = current_user.posts.where(date: @thursday)
    @fri = current_user.posts.where(date: @friday)
    @sat = current_user.posts.where(date: @saturday)
    @sun = current_user.posts.where(date: @sunday)
  end


  private
    def post_params
      params.require(:post).permit(:date, :price, :category1, :category2, :article)
    end

    def set_post
      @post = current_user.posts.find(params[:id])
    end
    
end