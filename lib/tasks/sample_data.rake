namespace :db do
  desc "Fill database with fake data"
  task populate: :environment do
    make_users
    make_posts
  end

  def make_users
    10.times do |n|
      name = Faker::Name.name
      email = Faker::Internet.email
      password = "dupa123"
      User.create!(username: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end

  def make_posts
    users = User.all
    50.times do
      users.each do |user|
        title = Faker::Lorem.sentence
        body = Faker::Lorem.paragraph
        user.posts.create!(title: title, body: body)
      end
    end
  end
end
