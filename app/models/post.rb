class Post < ApplicationRecord
	belongs_to :user

	validates :category1, presence: true
	validate :validate_category2_presence

	def start_time
		self.date
	end

  

	private

		def validate_category2_presence
			errors.add(:category2, "項目を選択してください") unless category2
		end
end
