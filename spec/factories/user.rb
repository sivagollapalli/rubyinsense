FactoryGirl.define do
  factory :user_1, :class => User do |d|
    d.email 'test1@gmail.com'
    d.provider 'Twitter'
    d.twitter_handle 'sivatesting1'
    d.twitter_url 'http://twitter.com/sivatesting1'
    d.uid 155833416
  end
  
  factory :user_2, :class => User do |d|
    d.email 'test2@gmail.com'
    d.provider 'Twitter'
    d.uid 155833416
  end
end
