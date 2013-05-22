class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments
  has_many :posts

  has_many :comment_votes
  has_many :voted_comments, :through => :comment_votes, :class_name => "Comment"

  has_many :post_votes
  has_many :voted_posts, :through => :post_votes, :class_name => "Post"
end

# 7 and 10 are here because if we define the has many through using comments
# then it will override line 3, so we rename the association, but tell it
# what the Class association is
