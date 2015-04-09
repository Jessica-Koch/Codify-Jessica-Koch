class Comment < ActiveRecord::Base
  validates :body, presence: true 
  belongs_to :task
  belongs_to :user

end
