class HomeController < ApplicationController
	 before_action :authenticate_user! 
  def index

  	respond_to do |format|
      format.html{
	  	@question =Question.new
	  	@ques= current_user.user_quess
	  	@answer =Answer.new
	  }

	end

  	# format.js{
   #          offset = params["offset"]
   #          if offset
   #            offset = offset.to_i
   #          else
   #            offset = 0
   #          end

   #          @new_offset = offset + 10
   #          @show_load_more = offset < current_user.feed.count
   #          @feed = current_user.feed.offset(offset).limit(10)
   #    }
   end
   
    def upload_image
    uploaded_file = params[:image]
    filename = SecureRandom.hex + "." +uploaded_file.original_filename.split('.')[1]
    filepath = Dir.pwd + "/public/uploads/" + filename
  File.open(filepath,'wb') do |file|
    file.write(uploaded_file.read())
  end

  current_user.profile_picture = filename
  current_user.save!
    return redirect_to '/profile'
  end
  
  










  
end
