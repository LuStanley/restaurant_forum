namespace :dev do


  task fake_comments: :environment do

    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(content: FFaker::Lorem.sentence,          
# The sample method on the array, returns a random id from the array.
          user: User.all.sample
          )

      end
    end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comment data"

  end
end
