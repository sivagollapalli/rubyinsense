class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :description,   :type => String, :default => ''
  
  belongs_to :question
  belongs_to :user

end
