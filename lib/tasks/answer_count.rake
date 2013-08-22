namespace :db do
  desc "Update answer count" 
  task :update_answer_count => :environment do
    Question.all.each do |q|
      q.answer_count = q.answers.size
      q.save
    end
  end
end

