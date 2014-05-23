class CompletedSurvey < ActiveRecord::Base
  belongs_to :survey_taker, class_name: "User", foreign_key: "user_id"
  belongs_to :survey
end
