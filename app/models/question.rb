class Question < ActiveRecord::Base
  has_many :options
  belongs_to :survey
  has_many :responses, through: :options
end
