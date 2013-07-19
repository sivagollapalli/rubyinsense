class Answer
  include Mongoid::Document
  include Mongo::Voteable

  belongs_to :question
  belongs_to :user
  
  field :statement, type: String

  validate :statement, presence: true

  voteable self, :up => +1, :down => -1
end
