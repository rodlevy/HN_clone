# def current_user
#   @user ||= User.where(id: session[:user_id]).first
# end

def current_user
  @user ||= User.find_by_username(session[:username])
end

def user_already_exists?(username, password)
  if User.find_by_username(username)
    User.find_by_username(username).password == password
  end
end

def post_not_voted?(post_id)
  if current_user
    user_id = current_user.id
    if PostVote.find_all_by_post_id_and_user_id_and_upvoted(post_id, user_id, true).count > 0
      return false
    else
      return true
    end
  end
end

def comment_not_voted?(comment_id)
  if current_user
    user_id = current_user.id
    if CommentVote.find_all_by_comment_id_and_user_id_and_upvoted(comment_id, user_id, true).count > 0
      return false
    else
      return true
    end
  end
end
