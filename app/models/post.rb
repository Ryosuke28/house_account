class Post < ApplicationRecord
	belongs_to :user

	validates :category1, presence: true
	validate :validate_category2_presence

	def show
		if self.present?
			# return "#{self.icon}#{self.article} #{self.price}円 <a href="edit_post_path(self)"><i class="fas fa-pen"></i></a>"
			return "#{self.try(:article)} #{self.try(:price)}円" 
		else
			return "none"
		end
	end

	def link
		if self.present?
			# return "#{self.icon}#{self.article} #{self.price}円 <a href="edit_post_path(self)"><i class="fas fa-pen"></i></a>"
			# return link_to "#{self.article} #{self.price}円", edit_post_path(self)
			return "a"
		else
			return "none"
		end
	end

	def rink
		if self.present?
			return "a"
		else
			return false
		end
	end

	# def icon
		# case self.category2
		# 	when 1
		# 		"<i class="fas fa-utensils"></i>"
		# 	when 2
		# 		"<i class="fas fa-toilet-paper"></i>"
		# 	when 3
		# 		"<i class="fas fa-tshirt"></i>"
		# 	when 4
		# 		"<i class="fas fa-futbol"></i>"
		# 	when 5
		# 		"<i class="fas fa-car-side"></i>"
		# 	when 6
		# 		"<i class="fas fa-graduation-cap"></i>"
		# 	when 7
		# 		"<i class="fas fa-hospital-alt"></i>"
		# 	when 8
		# 		"<i class="fas fa-users"></i>"
		# 	when 9
		# 		"<i class="far fa-sticky-note"></i>"
		# 	when 10
		# 		"<i class="fas fa-exclamation-circle"></i>"
		# 	when 11
		# 		"<i class="fas fa-exclamation-circle"></i>"
		# 	when 12
		# 		"<i class="fas fa-plug"></i>"
		# 	when 13
		# 		"<i class="fas fa-fire"></i>"
		# 	when 14
		# 		"<i class="fas fa-shower"></i>"
		# 	when 15
		# 		"<i class="fas fa-wifi"></i>"
		# 	when 16
		# 		"<i class="fas fa-mobile-alt"></i>"
		# 	when 17
		# 		"<i class="fas fa-coins"></i>"
		# 	when 18
		# 		"<i class="fas fa-wallet"></i>"
		# 	end
	# end

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
