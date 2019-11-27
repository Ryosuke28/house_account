class Post < ApplicationRecord
	belongs_to :user

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
			return puts "a"
		else
			return "none"
		end
	end

	# def icon
	# 	case self.category2
	# 		when 1
	# 			"<i class="fas fa-utensils"></i>"
	# 		when 2
	# 			"<i class="fas fa-toilet-paper"></i>"
	# 		when 3
	# 			"<i class="fas fa-tshirt"></i>"
	# 		when 4
	# 			"<i class="fas fa-futbol"></i>"
	# 		when 5
	# 			"<i class="fas fa-car-side"></i>"
	# 		when 6
	# 			"<i class="fas fa-graduation-cap"></i>"
	# 		when 7
	# 			"<i class="fas fa-hospital-alt"></i>"
	# 		when 8
	# 			"<i class="fas fa-users"></i>"
	# 		when 9
	# 			"<i class="far fa-sticky-note"></i>"
	# 		when 10
	# 			"<i class="fas fa-exclamation-circle"></i>"
	# 		when 11
	# 			"<i class="fas fa-exclamation-circle"></i>"
	# 		when 12
	# 			"<i class="fas fa-plug"></i>"
	# 		when 13
	# 			"<i class="fas fa-fire"></i>"
	# 		when 14
	# 			"<i class="fas fa-shower"></i>"
	# 		when 15
	# 			"<i class="fas fa-wifi"></i>"
	# 		when 16
	# 			"<i class="fas fa-mobile-alt"></i>"
	# 		when 17
	# 			"<i class="fas fa-coins"></i>"
	# 		when 18
	# 			"<i class="fas fa-wallet"></i>"
	# 		end
	# end
end
