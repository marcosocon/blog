class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :title, presence: true , length: {maximum:20}
	validates :body, presence: true
	before_create :set_visits_count

	has_attached_file :cover, styles: {medium:"1280x720", thumb:"800x600"}
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	private

	def set_visits_count
		self.visits_count = 0
	end
end
