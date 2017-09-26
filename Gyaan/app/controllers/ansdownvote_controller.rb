class AnsdownvoteController < ApplicationController
	def downvote
		@answer = Answer.find(params[:ans_id])
		downvote =Ansdownvote.where(user: current_user, answer:@answer).first
		upvote =Ansupvote.where(user: current_user, answer:@answer).first

		if !downvote && !upvote
			Ansdownvote.create(user: current_user, answer:@answer)
			@is_downvoted = true	
		elsif !downvote && upvote
			Ansdownvote.create(user: current_user, answer:@answer)
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
