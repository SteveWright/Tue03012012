class Comment < ActiveRecord::Base
	belongs_to :conversation
	belongs_to :user
	validates_prescence_of :body
end
