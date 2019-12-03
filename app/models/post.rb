class Post < ApplicationRecord
	belongs_to :user

	validates :category1, presence: true
	validate :validate_category2_presence

	def start_time
		self.date
	end

	def total_view(posts)
		post = {}

    post[:syokuhi]      = self.where(category2: 1).sum(:price).to_i
    post[:nitiyouhin]   = self.where(category2: 2).sum(:price).to_i
    post[:ihuku]        = self.where(category2: 3).sum(:price).to_i
    post[:goraku]       = self.where(category2: 4).sum(:price).to_i
    post[:koutuu]       = self.where(category2: 5).sum(:price).to_i
    post[:kyouyou]      = self.where(category2: 6).sum(:price).to_i
    post[:iryou]        = self.where(category2: 7).sum(:price).to_i
    post[:kousai]       = self.where(category2: 8).sum(:price).to_i
    post[:sonota_1]     = self.where(category2: 9).sum(:price).to_i

    post[:tokubetu_sum] = self.where(category1: 2).sum(:price).to_i

    post[:juukyo]       = self.where(category2: 1).sum(:price).to_i
    post[:denki]        = self.where(category2: 2).sum(:price).to_i
    post[:gasu]         = self.where(category2: 3).sum(:price).to_i
    post[:suidou]       = self.where(category2: 4).sum(:price).to_i
    post[:tuusin]       = self.where(category2: 5).sum(:price).to_i
    post[:keitai]       = self.where(category2: 6).sum(:price).to_i
    post[:kotei_sum]    = self.where(category1: 3).sum(:price).to_i
    
    post[:sousyunyu]    = self.where(category1: 4).sum(:price).to_i
		post[:sousisyutu]   = self.where(category1: [1..3]).sum(:price).to_i
		
		posts << post
	end

	private

		def validate_category2_presence
			errors.add(:category2, "項目を選択してください") unless category2
		end
end
