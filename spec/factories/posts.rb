FactoryBot.define do
	factory :post do
	date { '2019/12/1' }
	price { 500 }
	category1 { '1' }
	category2 { '2' }
	article { 'サンプルデータ１'}
	user
	end
end