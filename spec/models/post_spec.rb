require 'rails_helper'

RSpec.describe Post, type: :model do
	describe Post do
		before do
			@user_a = FactoryBot.create(:user, email: 'a@example.com') #ユーザーAの作成
		end
		describe "#create" do
			it "項目が全て入力されているときに登録できる" do
				@post = @user_a.posts.new(
					date: "2020/1/1",
					price: "500",
					category1: "1",
					category2: "1",
					article: "朝食"
				)
				expect(@post).to be_valid
			end
			it "category1がblankの場合、エラーになる" do
				@post = @user_a.posts.new(
					date: "2020/1/1",
					price: "500",
					category1: "",
					category2: "1",
					article: "朝食"
				)
				expect(@post).not_to be_valid
			end
			it "category2がblankの場合、エラーになる" do
				@post = @user_a.posts.new(
					date: "2020/1/1",
					price: "500",
					category1: "1",
					category2: nil,
					article: "朝食"
				)
				@post.valid?
				expect(@post.errors[:category2]).to include("項目を選択してください")
			end
		end
	end
end
