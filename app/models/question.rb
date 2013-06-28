class Question
  include Mongoid::Document

  field :statement, type: String
  field :level,     type:Integer
end
