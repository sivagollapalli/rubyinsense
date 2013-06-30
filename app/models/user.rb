class User
  include Mongoid::Document
  devise :database_authenticatable, :registerable
  field :email,               :type => String, :default => ''
  field :encrypted_password,  :type => String, :default => ''
  field :provider,            :type => String, :default => 'Twitter'
  field :uid,                 :type => Integer

  def password_required?
    false
  end
end

