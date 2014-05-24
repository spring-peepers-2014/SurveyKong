

# ================= User Sign In & Sign up page ======================

get '/login' do
  erb :user_sign_in_up
end

# ================= User Sign UP =================================

post '/sign_up' do
  user = User.new(params[:signup])

  if user.save
    session[:user_id] = user.id
    redirect to "/user/surveys"
  else
    redirect to '/login'
  end
end

# ================= User Sign In =================================

post '/sign_in' do
  user = User.authenticate(params[:signin])

  if user
    session[:user_id] = user.id
    redirect to "/user/surveys"
  else
    redirect '/login'
  end
end

# ================ User Log Out ================================

delete '/logout' do

  session.clear

  redirect to '/'
end

# Logged in users can view own profile only
# get '/user/:user_id' do
#   user_id = params[:user_id].to_i
#   if current_user.id == user_id
#     @user = current_user
#     erb :owner_profile
#   elsif current_user
#     redirect to "/user/#{current_user.id}"
#   else
#     redirect to '/'
#   end
# end

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

# # for development debugging only
# get '/logout' do
#   session[:user_id] = nil
#   redirect to '/'
# end
