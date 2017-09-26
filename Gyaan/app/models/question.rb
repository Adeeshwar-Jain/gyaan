class Question < ActiveRecord::Base
  belongs_to :user
   has_many:answers
	has_many:quesupvotes
	has_many:quesdownvotes
	
   validates :content, presence: true, length: {maximum: 140}
end
