class User
  include Mongoid::Document
  include Mongo::Voter
  include Mongoid::Paperclip
  
  devise :database_authenticatable, :registerable, :validatable
  field :email,               :type => String, :default => ''
  field :encrypted_password,  :type => String, :default => ''
  field :provider,            :type => String, :default => 'Twitter'
  field :uid,                 :type => Integer
  field :fname,               :type => String
  field :lname,               :type => String
  field :twitter_handle,      :type => String

  has_mongoid_attached_file :image,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    :styles => {
      :small => ['100x100', :jpg]
    }


  has_many :questions
  has_many :answers
  has_many :comments

  validates :uid, :email, presence: true
  def password_required?
    false
  end
end

