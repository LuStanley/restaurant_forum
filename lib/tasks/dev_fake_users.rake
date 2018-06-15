namespace :dev do


  task fake_users: :environment do


    20.times do |i|
      User.create!(email: FFaker::Internet.safe_email,
        password: "123456", name: FFaker::Name.first_name
        )

    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"

  end
end
