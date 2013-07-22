class User
  include Mongoid::Document
  include Mongo::Voter
  
  devise :database_authenticatable, :registerable, :validatable
  field :email,               :type => String, :default => ''
  field :encrypted_password,  :type => String, :default => ''
  field :provider,            :type => String, :default => 'Twitter'
  field :uid,                 :type => Integer
  field :twitter_handle,      :type => String  
  
  has_many :questions
  has_many :answers
  has_many :comments

  validates :uid, :email, presence: true
  
  after_create :set_twitter_handle

  def password_required?
    false
  end

  def set_twitter_handle
    handle = Twitter.user(self.uid)[:screen_name] 
    self.set(:twitter_handle, handle)
  end

end

