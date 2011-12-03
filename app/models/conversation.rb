class Conversation < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	belongs_to :board
	validates_prescence_of :title
	validates_lenfth_of :title, maximum => 50
end
