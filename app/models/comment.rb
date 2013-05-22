class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :post

  has_many :comment_votes
  has_many :voted_users, :through => :comment_votes, :class_name => "User"
end
