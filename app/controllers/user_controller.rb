# ================= Sign up =================================

post '/user/new' do
  user_info = { first_name: params[:first_name],
                last_name: params[:last_name],
                email: params[:email],
                password: params[:password] }
  user = User.new(user_info)

  if user.save
    session[:user_id] = user.id
    redirect to "/user/#{session[:user_id]}"
  else
    redirect to '/login'
  end
end

# ================= Sign In =================================

post '/login' do
  user_info = { email: params[:email],
                password: params[:password] }

  user = User.authenticate(user_info)

  if user
    session[:user_id] = user.id
    redirect to "/user/#{user.id}"
  else
    redirect '/'
  end
end

# ================ Log Out ================================

post '/logout' do

  session[:user_id] = nil

  redirect to '/'
end

# Logged in users can view own profile only
get '/user/:user_id' do
  @surveys = Survey.all
  user_id = params[:user_id].to_i
  if current_user.id == user_id
    @user = current_user
    erb :owner_profile
  elsif current_user
    redirect to "/user/#{current_user.id}"
  else
    redirect to '/'
  end
end

# Anyone can view user profiles
# Logged in users can view own profile with additional features

# get '/user/:user_id' do
#   user_id = params[:user_id]
#   @user = User.find(user_id) if User.exists?(user_id)

#   if @user == current_user
#     erb :owner_profile
#   elsif @user
#     erb :user_profile
#   elsif current_user
#     # erb :profile_does_not_exist
#     redirect to '/'
#   else
#     redirect to '/'
#   end
# end

# Logged in users can view other users profiles
# Logged in users can view own profile with additional features
# get '/user/:user_id' do
#   user_id = params[:user_id]
#   @user = User.find(user_id) if User.exists?(user_id)

#   if @user && current_user
#     if @user == current_user
#       erb :owner_profile
#     else
#       erb :user_profile
#     end
#   elsif current_user
#     # erb :profile_does_not_exist
#     redirect to '/'
#   else
#     redirect to '/'
#   end
# end

# post '/logout' do
#   session[:user_id] = nil
#   redirect to '/'
# end

# for development debugging only
get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end
