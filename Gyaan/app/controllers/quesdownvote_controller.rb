class QuesdownvoteController < ApplicationController

	def downvote
		@question = Question.find(params[:ques_id])
		downvote =Quesdownvote.where(user: current_user, question:@question).first
		upvote =Quesupvote.where(user: current_user, question:@question).first
		if !downvote&& !upvote
			Quesdownvote.create(user: current_user, question:@question)
			@is_downvoted = true

		elsif !downvote&& upvote
			Quesdownvote.create(user: current_user, question:@question)
			upvote.destroy!
			@is_downvoted = true		
			
		else			
			downvote.destroy!
			@is_downvoted = false
			
		end

		respond_to do |format|
			format.js {}
		end
		
	end


end
