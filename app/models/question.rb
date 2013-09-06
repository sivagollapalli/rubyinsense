class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Timestamps
  include Rubyinsense::EncodeUrl

  rateable range: (0..5), raters: User

  field :statement, type: String
  field :answer_count, type: Integer, default: 0


  belongs_to :user
  has_many :answers
  has_many :comments

  validates :statement, :presence => true

  def question_posted?(current_user)
    user == current_user
  end

end
