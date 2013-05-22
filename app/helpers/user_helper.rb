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
