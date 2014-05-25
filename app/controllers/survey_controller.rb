# ============== Survey List ===============

get '/surveys' do

  @surveys = Survey.order('created_at DESC')

  erb :survey_read
end



# =============== Survey User created =====================

get '/user/surveys' do

  @surveys = Survey.find_by(user_id: session[:user_id])

  erb :user_profile
end


# ============ Show the questions and Optoins =============

get '/survey/:title' do

  @survey = Survey.find_by(title: params[:title])

  erb :survey_questions
end


post '/survey/completed' do

  params[:option].each_value do |option_id|
    Response.create(option_id: option_id)
  end

  redirect '/surveys'
end


# ================= Survey Result ===================
get '/survey/:id/result' do

  @survey = Survey.find(params[:id])

  erb :survey_result
end
