FactoryGirl.define do
  factory :question_1, :class => Question do |d|
    d.statement 'Is this a test question?'
    d.answer_count 2
    d.association :user, :factory => :user_1
    #d.association :comment_1
    #d.association :answer_1
  end
end
