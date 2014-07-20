class Block < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	#makes sure there is an appropriate block title
	validates :title, presence: true, length: {minimum: 3}
end
