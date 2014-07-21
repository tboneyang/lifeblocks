class Block < ActiveRecord::Base
	acts_as_taggable
	
	has_many :comments, dependent: :destroy

	#makes sure there is an appropriate block title
	validates :title, presence: true, length: {minimum: 3}
end
