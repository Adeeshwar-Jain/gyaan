class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many:ansupvotes
	has_many:ansdownvotes
  validates :content, presence: true, length: {maximum: 10000}
end
