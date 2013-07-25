namespace :db do
  desc "find twitter handle of all the users" 
  task :find_twitter_handle => :environment do
    users = User.all
    unless users.empty?
      users.each do |user|
        user.set_twitter_handle
      end
    end
  end
end

