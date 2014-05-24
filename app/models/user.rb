class User < ActiveRecord::Base

  has_many :created_surveys, class_name: "Survey"
  has_many :completed_surveys
  has_many :taken_surveys, through: :completed_surveys, source: :survey

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :save
  validates :password, presence: true

  include BCrypt # BCrypt module contains `class Password`

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def self.authenticate(user_info)
    email = user_info[:email]
    password = user_info[:password]
    # user = User.find_by_email(email) # deprecated ActiveRecord method
    user = User.find_by(email: email) # latest ActiveRecord method
    return user if user && user.password == password
    nil
  end

  def get_name
    "#{self.first_name} #{self.last_name}"
  end

end
