namespace :db do
  task :populate => :environment do
	
  	require 'populator'
	require 'faker'
  	
	[Board, Conversation, User, Comment].each(&:delete_all)
	
	    
	#Board.populate 50 do |board|
	#	board.title = Populator.words(1..6).titleize
	#	Conversation.populate 50 do |conversation|
	#		conversation.title = Populator.words(1..5).titleize
	#		conversation.board_id = board.id
	#		conversation.user_id = 1
	#		Comment.populate 50 do |comment|
	#			comment.conversation_id = conversation.id
	#			comment.body = Populator.sentences(1..5)
	#			comment.created_at = 2.years.ago..Time.now
	#	end
	 # end
	#end
end
end


  