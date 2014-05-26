# ============== Survey List ===============

get '/surveys' do

  @surveys = Survey.order('created_at DESC')

  erb :"/survey/all_surveys"
end

# ============== Create Survey =====================

get '/survey/new' do
  erb :"/survey/new_survey"
end

post '/survey/new' do
  if !current_user
    redirect to '/'
  else
    new_survey = Survey.create(title: params[:title], creator: current_user)

    params[:question].each do |key, question_value|
      question = Question.create(q_text: question_value, survey: new_survey)
      params[:option][key].split(",").each do |option|
        Option.create(o_text: option, question: question)
      end
    end
  end
  redirect to "/surveys"
end

# ============ Show the questions and Options =============

post '/survey/complete' do
  params[:option].each_value do |option|
    Response.create(option_id: option)
  end
  survey_id = params[:survey_id]
  redirect "/survey/#{survey_id}/results"
end

get '/survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :"/survey/take_survey"
end


# ================= Survey Result ===================
get '/survey/:survey_id/results' do
  @survey = Survey.find(params[:survey_id])
  erb :"/survey/survey_result"
end
