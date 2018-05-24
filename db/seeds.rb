User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:true)
            #  activated: true,
            #  activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
              #  activated: true,
              #  activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.order(:created_at).take(1)
10.times do |n|
  title = Faker::Lorem.sentence(2)
  name = Faker::Name.name
  users.each { |user| user.forums.create!(title: title, name: name) }
end

forums = Forum.all
users = User.order(:created_at).take(6)
forums.each { |forum|
  10.times do
    name = Faker::Lorem.sentence(2)
    content = Faker::Lorem.sentence(10)
    users.each { |user| user.messages.create!(content: content, name: name, forum_id: forum.id) }
  end
}


users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
