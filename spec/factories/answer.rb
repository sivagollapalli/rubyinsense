FactoryGirl.define do
  factory :answer_1, :class =>  Answer do |d|
    d.statement "It is the first answer"
    d.association :question_1
    d.association :user_2
  end
end 
