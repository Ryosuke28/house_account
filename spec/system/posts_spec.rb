require 'rails_helper'

describe 'ログイン・ログアウト機能', type: :system do
	describe 'ログイン機能' do
		before do
			user_a = FactoryBot.create(:user, email: 'a@example.com') #ユーザーAの作成
			#ユーザーAで支出を登録
			FactoryBot.create(:post, article: '最初の投稿', user: user_a)
		end
		context 'ユーザーAでログインしているとき' do
			before do
				#ユーザーAでログイン
				visit new_user_session_path
				fill_in 'メールアドレス', with: 'a@example.com'
				fill_in 'パスワード', with: 'password'
				click_button 'ログイン'
			end
			it 'ユーザーAが作成した支出が表示される' do
				expect(page).to have_content 'ログインしました' #ログインできたことを確認
				#作成した支出が画面上に表示されていることを確認
			end
		end
		context 'ユーザーAでログアウトしたとき' do
			before do
				#ユーザーAでログイン
				visit new_user_session_path
				fill_in 'メールアドレス', with: 'a@example.com'
				fill_in 'パスワード', with: 'password'
				click_button 'ログイン'
				click_button '閉じる'
				click_link 'ログアウト' # ユーザーAでログアウトする
			end
			it 'ログインページに戻る' do
				expect(page).to have_content '新規アカウント作成はこちら' # ログアウトできたことを確認
			end
		end
	end
end