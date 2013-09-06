FactoryGirl.define do 
  factory :comment_1, :class => Comment do |d|
    d.description 'First comment ever..!!!'
    d.association :question_1
    #d.association :user_1
  end
end
