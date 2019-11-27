class PostsController < ApplicationController


  def index
    @post = Post.new
    d = Date.today
    @syunyu = current_user.posts.where(date: d.in_time_zone.all_month).where(category1: 4).sum(:price)
    @shisyutu = current_user.posts.where(date: d.in_time_zone.all_month).where(category1: [1..3]).sum(:price)
    @syushi = @syunyu - @shisyutu
  end

  def create
    post = current_user.posts.new(post_params)
    
    if post.save
      redirect_to posts_url, notice: "保存しました"
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def month
    d = Date.today
    @posts = current_user.posts.where(date: d.in_time_zone.all_month)

    @kyuuryou = @posts.where(category1: 4).where(category2: 1).sum(:price).to_i
    @sonota_2 = @posts.where(category1: 4).where(category2: 2).sum(:price).to_i
    @sonota_2s = @posts.where(category1: 4).where(category2: 2)


    @syokuhi = @posts.where(category1: 1).where(category2: 1).sum(:price).to_i
    @nitiyouhin = @posts.where(category1: 1).where(category2: 2).sum(:price).to_i
    @ihuku = @posts.where(category1: 1).where(category2: 3).sum(:price).to_i
    @goraku = @posts.where(category1: 1).where(category2: 4).sum(:price).to_i
    @koutuu = @posts.where(category1: 1).where(category2: 5).sum(:price).to_i
    @kyouyou = @posts.where(category1: 1).where(category2: 6).sum(:price).to_i
    @iryou = @posts.where(category1: 1).where(category2: 7).sum(:price).to_i
    @kousai = @posts.where(category1: 1).where(category2: 8).sum(:price).to_i
    @sonota_1 = @posts.where(category1: 1).where(category2: 9).sum(:price).to_i
    @seikatu_sum = @posts.where(category1: 1).sum(:price).to_i

    @tokubetus = @posts.where(category1: 2).where(category2: 1)
    @tokubetu_sum = @posts.where(category1: 2).sum(:price).to_i


    @juukyo = @posts.where(category1: 3).where(category2: 1).sum(:price).to_i
    @denki = @posts.where(category1: 3).where(category2: 2).sum(:price).to_i
    @gasu = @posts.where(category1: 3).where(category2: 3).sum(:price).to_i
    @suidou = @posts.where(category1: 3).where(category2: 4).sum(:price).to_i
    @tuusin = @posts.where(category1: 3).where(category2: 5).sum(:price).to_i
    @keitai = @posts.where(category1: 3).where(category2: 6).sum(:price).to_i
    @kotei_sum = @posts.where(category1: 3).sum(:price).to_i
    
    @sousisyutu = @posts.where(category1: [1..3]).sum(:price).to_i
  end



  def year
    @baseday = Date.today


    @posts6 = current_user.posts.where(date: @baseday.in_time_zone.all_month)

    @syokuhi6 = @posts6.where(category1: 1).where(category2: 1).sum(:price).to_i
    @nitiyouhin6 = @posts6.where(category1: 1).where(category2: 2).sum(:price).to_i
    @ihuku6 = @posts6.where(category1: 1).where(category2: 3).sum(:price).to_i
    @goraku6 = @posts6.where(category1: 1).where(category2: 4).sum(:price).to_i
    @koutuu6 = @posts6.where(category1: 1).where(category2: 5).sum(:price).to_i
    @kyouyou6 = @posts6.where(category1: 1).where(category2: 6).sum(:price).to_i
    @iryou6 = @posts6.where(category1: 1).where(category2: 7).sum(:price).to_i
    @kousai6 = @posts6.where(category1: 1).where(category2: 8).sum(:price).to_i
    @sonota_1_6 = @posts6.where(category1: 1).where(category2: 9).sum(:price).to_i

    @tokubetu_sum6 = @posts6.where(category1: 2).sum(:price).to_i

    @juukyo6 = @posts6.where(category1: 3).where(category2: 1).sum(:price).to_i
    @denki6 = @posts6.where(category1: 3).where(category2: 2).sum(:price).to_i
    @gasu6 = @posts6.where(category1: 3).where(category2: 3).sum(:price).to_i
    @suidou6 = @posts6.where(category1: 3).where(category2: 4).sum(:price).to_i
    @tuusin6 = @posts6.where(category1: 3).where(category2: 5).sum(:price).to_i
    @keitai6 = @posts6.where(category1: 3).where(category2: 6).sum(:price).to_i
    @kotei_sum6 = @posts6.where(category1: 3).sum(:price).to_i
    
    @sousyunyu6 = @posts6.where(category1: 4).sum(:price).to_i
    @sousisyutu6 = @posts6.where(category1: [1..3]).sum(:price).to_i






    @posts5 = Post.where(user_id: session[:user_id]).where(date: @baseday.prev_month(1).in_time_zone.all_month)

    @syokuhi5 = @posts5.where(category1: 1).where(category2: 1).sum(:price).to_i
    @nitiyouhin5 = @posts5.where(category1: 1).where(category2: 2).sum(:price).to_i
    @ihuku5 = @posts5.where(category1: 1).where(category2: 3).sum(:price).to_i
    @goraku5 = @posts5.where(category1: 1).where(category2: 4).sum(:price).to_i
    @koutuu5 = @posts5.where(category1: 1).where(category2: 5).sum(:price).to_i
    @kyouyou5 = @posts5.where(category1: 1).where(category2: 6).sum(:price).to_i
    @iryou5 = @posts5.where(category1: 1).where(category2: 7).sum(:price).to_i
    @kousai5 = @posts5.where(category1: 1).where(category2: 8).sum(:price).to_i
    @sonota_1_5 = @posts5.where(category1: 1).where(category2: 9).sum(:price).to_i

    @tokubetu_sum5 = @posts5.where(category1: 2).sum(:price).to_i

    @juukyo5 = @posts5.where(category1: 3).where(category2: 1).sum(:price).to_i
    @denki5 = @posts5.where(category1: 3).where(category2: 2).sum(:price).to_i
    @gasu5 = @posts5.where(category1: 3).where(category2: 3).sum(:price).to_i
    @suidou5 = @posts5.where(category1: 3).where(category2: 4).sum(:price).to_i
    @tuusin5 = @posts5.where(category1: 3).where(category2: 5).sum(:price).to_i
    @keitai5 = @posts5.where(category1: 3).where(category2: 6).sum(:price).to_i
    @kotei_sum5 = @posts5.where(category1: 3).sum(:price).to_i
    
    @sousyunyu5 = @posts5.where(category1: 4).sum(:price).to_i
    @sousisyutu5 = @posts5.where(category1: [1..3]).sum(:price).to_i






    @posts4 = Post.where(user_id: session[:user_id]).where(date: @baseday.prev_month(2).in_time_zone.all_month)

    @syokuhi4 = @posts4.where(category1: 1).where(category2: 1).sum(:price).to_i
    @nitiyouhin4 = @posts4.where(category1: 1).where(category2: 2).sum(:price).to_i
    @ihuku4 = @posts4.where(category1: 1).where(category2: 3).sum(:price).to_i
    @goraku4 = @posts4.where(category1: 1).where(category2: 4).sum(:price).to_i
    @koutuu4 = @posts4.where(category1: 1).where(category2: 5).sum(:price).to_i
    @kyouyou4 = @posts4.where(category1: 1).where(category2: 6).sum(:price).to_i
    @iryou4 = @posts4.where(category1: 1).where(category2: 7).sum(:price).to_i
    @kousai4 = @posts4.where(category1: 1).where(category2: 8).sum(:price).to_i
    @sonota_1_4 = @posts4.where(category1: 1).where(category2: 9).sum(:price).to_i

    @tokubetu_sum4 = @posts4.where(category1: 2).sum(:price).to_i

    @juukyo4 = @posts4.where(category1: 3).where(category2: 1).sum(:price).to_i
    @denki4 = @posts4.where(category1: 3).where(category2: 2).sum(:price).to_i
    @gasu4 = @posts4.where(category1: 3).where(category2: 3).sum(:price).to_i
    @suidou4 = @posts4.where(category1: 3).where(category2: 4).sum(:price).to_i
    @tuusin4 = @posts4.where(category1: 3).where(category2: 5).sum(:price).to_i
    @keitai4 = @posts4.where(category1: 3).where(category2: 6).sum(:price).to_i
    @kotei_sum4 = @posts4.where(category1: 3).sum(:price).to_i
    
    @sousyunyu4 = @posts4.where(category1: 4).sum(:price).to_i
    @sousisyutu4 = @posts4.where(category1: [1..3]).sum(:price).to_i





    @posts3 = Post.where(user_id: session[:user_id]).where(date: @baseday.prev_month(3).in_time_zone.all_month)

    @syokuhi3 = @posts3.where(category1: 1).where(category2: 1).sum(:price).to_i
    @nitiyouhin3 = @posts3.where(category1: 1).where(category2: 2).sum(:price).to_i
    @ihuku3 = @posts3.where(category1: 1).where(category2: 3).sum(:price).to_i
    @goraku3 = @posts3.where(category1: 1).where(category2: 4).sum(:price).to_i
    @koutuu3 = @posts3.where(category1: 1).where(category2: 5).sum(:price).to_i
    @kyouyou3 = @posts3.where(category1: 1).where(category2: 6).sum(:price).to_i
    @iryou3 = @posts3.where(category1: 1).where(category2: 7).sum(:price).to_i
    @kousai3 = @posts3.where(category1: 1).where(category2: 8).sum(:price).to_i
    @sonota_1_3 = @posts3.where(category1: 1).where(category2: 9).sum(:price).to_i

    @tokubetu_sum3 = @posts3.where(category1: 2).sum(:price).to_i

    @juukyo3 = @posts3.where(category1: 3).where(category2: 1).sum(:price).to_i
    @denki3 = @posts3.where(category1: 3).where(category2: 2).sum(:price).to_i
    @gasu3 = @posts3.where(category1: 3).where(category2: 3).sum(:price).to_i
    @suidou3 = @posts3.where(category1: 3).where(category2: 4).sum(:price).to_i
    @tuusin3 = @posts3.where(category1: 3).where(category2: 5).sum(:price).to_i
    @keitai3 = @posts3.where(category1: 3).where(category2: 6).sum(:price).to_i
    @kotei_sum3 = @posts3.where(category1: 3).sum(:price).to_i
    
    @sousyunyu3 = @posts3.where(category1: 4).sum(:price).to_i
    @sousisyutu3 = @posts3.where(category1: [1..3]).sum(:price).to_i




    @posts2 = Post.where(user_id: session[:user_id]).where(date: @baseday.prev_month(4).in_time_zone.all_month)

    @syokuhi2 = @posts2.where(category1: 1).where(category2: 1).sum(:price).to_i
    @nitiyouhin2 = @posts2.where(category1: 1).where(category2: 2).sum(:price).to_i
    @ihuku2 = @posts2.where(category1: 1).where(category2: 3).sum(:price).to_i
    @goraku2 = @posts2.where(category1: 1).where(category2: 4).sum(:price).to_i
    @koutuu2 = @posts2.where(category1: 1).where(category2: 5).sum(:price).to_i
    @kyouyou2 = @posts2.where(category1: 1).where(category2: 6).sum(:price).to_i
    @iryou2 = @posts2.where(category1: 1).where(category2: 7).sum(:price).to_i
    @kousai2 = @posts2.where(category1: 1).where(category2: 8).sum(:price).to_i
    @sonota_1_2 = @posts2.where(category1: 1).where(category2: 9).sum(:price).to_i

    @tokubetu_sum2 = @posts2.where(category1: 2).sum(:price).to_i

    @juukyo2 = @posts2.where(category1: 3).where(category2: 1).sum(:price).to_i
    @denki2 = @posts2.where(category1: 3).where(category2: 2).sum(:price).to_i
    @gasu2 = @posts2.where(category1: 3).where(category2: 3).sum(:price).to_i
    @suidou2 = @posts2.where(category1: 3).where(category2: 4).sum(:price).to_i
    @tuusin2 = @posts2.where(category1: 3).where(category2: 5).sum(:price).to_i
    @keitai2 = @posts2.where(category1: 3).where(category2: 6).sum(:price).to_i
    @kotei_sum2 = @posts2.where(category1: 3).sum(:price).to_i
    
    @sousyunyu2 = @posts2.where(category1: 4).sum(:price).to_i
    @sousisyutu2 = @posts2.where(category1: [1..3]).sum(:price).to_i






    @posts1 = Post.where(user_id: session[:user_id]).where(date: @baseday.prev_month(5).in_time_zone.all_month)

    @syokuhi1 = @posts1.where(category1: 1).where(category2: 1).sum(:price).to_i
    @nitiyouhin1 = @posts1.where(category1: 1).where(category2: 2).sum(:price).to_i
    @ihuku1 = @posts1.where(category1: 1).where(category2: 3).sum(:price).to_i
    @goraku1 = @posts1.where(category1: 1).where(category2: 4).sum(:price).to_i
    @koutuu1 = @posts1.where(category1: 1).where(category2: 5).sum(:price).to_i
    @kyouyou1 = @posts1.where(category1: 1).where(category2: 6).sum(:price).to_i
    @iryou1 = @posts1.where(category1: 1).where(category2: 7).sum(:price).to_i
    @kousai1 = @posts1.where(category1: 1).where(category2: 8).sum(:price).to_i
    @sonota_1_1 = @posts1.where(category1: 1).where(category2: 9).sum(:price).to_i

    @tokubetu_sum1 = @posts1.where(category1: 2).sum(:price).to_i

    @juukyo1 = @posts1.where(category1: 3).where(category2: 1).sum(:price).to_i
    @denki1 = @posts1.where(category1: 3).where(category2: 2).sum(:price).to_i
    @gasu1 = @posts1.where(category1: 3).where(category2: 3).sum(:price).to_i
    @suidou1 = @posts1.where(category1: 3).where(category2: 4).sum(:price).to_i
    @tuusin1 = @posts1.where(category1: 3).where(category2: 5).sum(:price).to_i
    @keitai1 = @posts1.where(category1: 3).where(category2: 6).sum(:price).to_i
    @kotei_sum1 = @posts1.where(category1: 3).sum(:price).to_i
    
    @sousyunyu1 = @posts1.where(category1: 4).sum(:price).to_i
    @sousisyutu1 = @posts1.where(category1: [1..3]).sum(:price).to_i

  end

  def note
    @post = Post.new


    d = Date.today
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

    @mon = current_user.posts.where(date: @monday)
    @tue = current_user.posts.where(date: @tuesday)
    @wed = current_user.posts.where(date: @wednesday)
    @thu = current_user.posts.where(date: @thursday)
    @fri = current_user.posts.where(date: @friday)
    @sat = current_user.posts.where(date: @saturday)
    @sun = current_user.posts.where(date: @sunday)

    # @week1 = Post.where(user_id: session[:user_id]).where("date ='" + @monday.strftime("%Y-%m-%d") + "'").order(category1: "desc", category2: "asc").to_a
    # @week2 = Post.where(user_id: session[:user_id]).where("date ='" + (@monday + 1 ).strftime("%Y-%m-%d") + "'").order(date: "asc").to_a
    # @week3 = Post.where(user_id: session[:user_id]).where("date ='" + (@monday + 2 ).strftime("%Y-%m-%d") + "'").order(date: "asc").to_a
    # @week4 = Post.where(user_id: session[:user_id]).where("date ='" + (@monday + 3 ).strftime("%Y-%m-%d") + "'").order(date: "asc").to_a
    # @week5 = Post.where(user_id: session[:user_id]).where("date ='" + (@monday + 4 ).strftime("%Y-%m-%d") + "'").order(date: "asc").to_a
    # @week6 = Post.where(user_id: session[:user_id]).where("date ='" + (@monday + 5 ).strftime("%Y-%m-%d") + "'").order(date: "asc").to_a
    # @week7 = Post.where(user_id: session[:user_id]).where("date ='" + (@monday + 6 ).strftime("%Y-%m-%d") + "'").where("category1<>3").order(date: "asc",category1: "desc", category2: "asc").to_a
      
    # @week7[category1][category2][1]
    # @week7[][][]



  end


  private
    def post_params
      params.require(:post).permit(:date, :price, :category1, :category2, :article)
    end
end