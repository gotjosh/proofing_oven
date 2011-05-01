namespace :db do
  desc 'Populate dev data'
  task populate: :environment do
    DatabaseCleaner.clean

    ['paul@hashrocket.com', 'jeperkins4@yahoo.com'].each do |email|
      user = Fabricate(:user, email: email)

      30.times do
        candidate = Fabricate(
          :candidate,
          user: user,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name
        )

        3.times do
          Fabricate(
            :note,
            candidate: candidate,
            comment: Faker::Lorem.paragraph,
            added_on: rand(20).days.ago
          )
        end
      end
    end
  end
end
