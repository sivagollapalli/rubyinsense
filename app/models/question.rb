class Question
  include Mongoid::Document
  
  has_many :answers
  belongs_to :user

  field :statement, type: String
  field :level,     type:Integer

  validates :statement, :presence => true
end
