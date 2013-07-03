class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_many :answers
  belongs_to :user

  field :statement, type: String

  validates :statement, :presence => true

end
