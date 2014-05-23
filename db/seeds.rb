# survey creator
creator = User.create!(first_name: "Ruben", last_name: "Osorio", email: "hi@email.com", password: "password")

# survey taker
survey_taker = User.create!(first_name: "Christine", last_name: "Feaster", email: "hello@email.com", password: "password")

Survey.create!(title: "Test Survey", creator: creator)