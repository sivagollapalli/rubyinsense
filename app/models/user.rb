class User
  include Mongoid::Document
  
  devise :database_authenticatable, :registerable, :validatable
  field :email,               :type => String, :default => ''
  field :encrypted_password,  :type => String, :default => ''
  field :provider,            :type => String, :default => 'Twitter'
  field :uid,                 :type => Integer
  
  has_many :questions
  has_many :answers
  has_many :comments

  def password_required?
    false
  end
end

