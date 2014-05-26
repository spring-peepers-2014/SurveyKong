class Survey < ActiveRecord::Base

  has_many :completed_surveys
  has_many :survey_takers, through: :completed_surveys
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :questions

end
