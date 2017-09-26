class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many:questions


  has_many:answers
def user_quess
	users=sel_users
	Question.where(user_id:users).order(created_at: :desc)
end
 def ques_ans q
  q.answers
end

def all_users
  User.all
end






  def sel_users
  	User.all.pluck(:id)
  end

end
