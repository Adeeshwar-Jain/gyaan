class AnsupvoteController < ApplicationController
	def upvote
		@answer = Answer.find(params[:ans_id])
		upvote =Ansupvote.where(user: current_user, answer:@answer).first
		downvote=Ansdownvote.where(user: current_user, answer:@answer).first
		if !upvote && !downvote
			Ansupvote.create(user: current_user, answer:@answer)
			@is_upvoted = true	

		elsif !upvote && downvote
			Ansupvote.create(user: current_user, answer:@answer)
			downvote.destroy!
			@is_upvoted = true	
						
		else			
			upvote.destroy!
			@is_upvoted = false
			
		end

		respond_to do |format|
			format.js {}
		end
		
	end
end
