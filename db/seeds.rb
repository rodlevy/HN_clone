require 'faker'

10.times do |id|
  User.create(:username => Faker::Internet.user_name, 
              :password => Faker::Lorem.word)
  Post.create(:title    => Faker::Lorem.sentence(5),
              :url      => Faker::Internet.domain_name,
              :user_id  => id + 1)
  Comment.create(:body  => Faker::Lorem.paragraph(2),
                 :user_id => id + 1,
                 :post_id => id + 1)
end

