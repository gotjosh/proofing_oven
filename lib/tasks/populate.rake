namespace :db do
  desc 'Populate dev data'
  task populate: :environment do
    DatabaseCleaner.clean

    ['paul@hashrocket.com', 'jeperkins4@yahoo.com'].each do |email|
      user = Fabricate(:user, email: email)

      30.times do
        Fabricate(:candidate, user: user)
      end
    end
  end
end
