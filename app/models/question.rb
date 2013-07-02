class Question
  include Mongoid::Document
  
  has_many :answers
  belongs_to :user

  field :statement, type: String

  validates :statement, :presence => true

end
