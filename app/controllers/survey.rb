# ============== Survey List ===============

get '/surveys' do

  @surveys = Survey.order('created_at DESC')

  erb :all_surveys
end

# ============== Create Survey =====================

get '/survey/new' do
  erb :new_survey
end

post '/survey/new' do
  if !current_user
    redirect to '/'
  else
    new_survey = Survey.create(title: params[:title], creator: current_user)

    params[:question].each do |key, question_value|
      question = Question.create(q_text: question_value, survey: new_survey)
      params[:choice][key].split(",").each do |choice|
        Option.create(o_text: choice, question: question)
      end
    end
  end
  redirect to "/survey/#{new_survey.title}"
end

# ============ Show the questions and Options =============

post '/survey/complete' do

  params[:option].each_value do |option|
    Response.create(option_id: option)
    @survey_id = option.question_id
  end
  @survey_title =
  redirect '/survey/:title/results'
end

get '/survey/:title' do
  @survey = Survey.find_by(title: params[:title])
  erb :survey
end


# ================= Survey Result ===================
get '/survey/:title/results' do
  @survey = Survey.find_by(title: params[:title])
  erb :survey_result
end
