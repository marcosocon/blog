class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :title, presence: true , length: {maximum:20}
	validates :body, presence: true
	before_create :set_visits_count

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	private

	def set_visits_count
		self.visits_count = 0
	end
end
