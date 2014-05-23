class Survey < ActiveRecord::Base
  has_many :questions
  has_many :responses, through: :questions
  has_many :takers, class_name: "User"
  has_many :creators, class_name: "User"
end
