get '/' do
  # All Posts
  erb :index
end

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end

get '/users/:user_id' do
  @user_id = params[:user_id]
  erb :profile
end

get '/users/:user_id/posts' do
  @user_id = params[:user_id]
  erb :user_posts
end

get '/users/:user_id/comments' do 
  @user_id = params[:user_id]
  erb :user_comments
end

get '/login' do
  erb :login
end

get '/logout' do
  session[:username] = nil
  redirect to '/'
end


post '/create_user' do
  if user_already_exists?(params[:username], params[:password])
  @status = "user already exists"
  else
    User.create(:username => params[:username], 
                :password => params[:password])
    session[:username] = params[:username]
  @status = "#{params[:username]} is created"
  end 
  erb :index
end

post '/login' do
  if user_already_exists?(params[:username], params[:password])
  @status = "successfully logged in";
  session[:username] = params[:username]
  end
  erb :index
end
