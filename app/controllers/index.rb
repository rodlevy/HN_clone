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
  else
    User.create(:username => params[:username], 
                :password => params[:password])
    session[:username] = params[:username]
  end 
  redirect to '/'
end

post '/login' do
  if user_already_exists?(params[:username], params[:password])
  session[:username] = params[:username]
  end
  redirect to '/'
end

post '/postvote' do
  post_id = params[:post_id]
  user_id = params[:user_id]
  post_vote = PostVote.create(:user_id => user_id,
                  :post_id => post_id,
                  :upvoted => true)

  if request.xhr?
    content_type :json
    post_vote.to_json
  else
    redirect to '/'
  end
end

post '/commentvote' do
  comment_id = params[:comment_id]
  user_id = params[:user_id]
  comment_vote = CommentVote.create(:user_id => user_id,
                  :comment_id => comment_id,
                  :upvoted => true)

  if request.xhr?
    content_type :json
    comment_vote.to_json
  else
    redirect to '/'
  end
end
