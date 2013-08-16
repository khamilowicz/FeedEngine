namespace :db do 
  desc "populates database with seed data"
  task :populate => :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:migrate'].invoke

    users = FactoryGirl.create_list(:user, 2);
    users.each do |u| 
      u.feeds << FactoryGirl.create(:feed, :with_posts, post_number: 3)
    end 
  end
end