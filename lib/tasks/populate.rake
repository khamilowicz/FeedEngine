namespace :db do 
  desc "populates database with seed data"
  task :populate => :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:migrate'].invoke

    users = FactoryGirl.create_list(:user, 2);
    users.each do |u| 
      2.times {
      u.add_to_main_feed FactoryGirl.create(:post)
      }
    end 
  end
end