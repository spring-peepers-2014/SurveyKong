# ============== Survey List ===============

get '/surveys' do

  @surveys = Survey.order('created_at DESC')

  erb :survey_read
end

# ============== Create Survey =====================

get '/survey/new' do

  erb :survey_create
end

post '/survey/new' do

  survey_new = Survey.create(title: params[:title], creator: current_user)
  hash = {}
  params[:question].each do |key, question_value|
      question = Question.create(q_text: question_value, survey: survey_new)
    params[:choice][key].split(",").each do |choice|
      Option.create(o_text: choice, question: question)
    end
  end
  p params
   # redirect '/surveys'
end

# ============ Show the questions and Options =============

post '/survey/completed' do

  params[:option].each_value do |option_id|
    Response.create(option_id: option_id)
  end

  redirect '/surveys'
end

get '/survey/:title' do

  @survey = Survey.find_by(title: params[:title])

  erb :survey_questions
end


# ================= Survey Result ===================
get '/survey/:id/result' do

  @survey = Survey.find(params[:id])

  erb :survey_result
end
