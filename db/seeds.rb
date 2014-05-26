# survey creator
creator = User.create(first_name: "Ruben", last_name: "Osorio", email: "hi@email.com", password: "password")

# survey taker
survey_taker = User.create(first_name: "Christine", last_name: "Feaster", email: "hello@email.com", password: "password")

# Dummy Surveys
survey_car = Survey.create(title: "Best Car", creator: creator)
beer_survey = Survey.create(title: "Best Beer", creator: creator)

# Beer
question_beer = Question.create(q_text: "In United States", survey: beer_survey)

%w(Samuel-Adams Founders Bells Growler).each do |brand|
	Option.create!(o_text: brand, question: question_beer)
end

# Cars
question_germany = Question.create(q_text: "From Germany", survey: survey_car)

question_korea = Question.create(q_text: "From Korea", survey: survey_car)

%w(Audi BMW Mercdes-Benz).each do |brand|
	Option.create(o_text: brand, question: question_germany)
end

%w(KIA Hyundai Samsung).each do |brand|
	Option.create(o_text: brand, question: question_korea)
end
