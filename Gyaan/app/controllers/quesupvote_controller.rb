class QuesupvoteController < ApplicationController

	def upvote
		@question = Question.find(params[:ques_id])
		upvote =Quesupvote.where(user: current_user, question:@question).first
		downvote=Quesdownvote.where(user: current_user, question:@question).first
		# byebug
		if !upvote && !downvote
			Quesupvote.create(user: current_user, question:@question)
			@is_upvoted = true

		elsif !upvote && downvote
			Quesupvote.create(user: current_user, question:@question)
			@is_upvoted = true
			downvote.destroy!	
			
		else			
			upvote.destroy!
			@is_upvoted = false
			
		end

		respond_to do |format|
			format.js {}
		end
		
	end






end
