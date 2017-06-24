User.create full_name: "Hoàng Hải - Framgia",
  email: "hai.hp.96@gmail.com",
  password: "123456"

100.times do |index|
  User.create full_name: FFaker::NameVN.name,
    email: "example-#{index+1}@railstutorial.org",
    gender: Random.rand(0..2),
    password: "123456"
end

1000.times do |index|
  Post.create title: FFaker::Education.degree_short,
    context: FFaker::Education.degree,
    user_id: Random.rand(1..10)
end

10000.times do |index|
  Comment.create context: FFaker::Lorem.phrase,
    post_id: Random.rand(1..100),
    user_id: Random.rand(1..10)
end

100.times do |index|
  Relationship.create follower_id: Random.rand(1..10),
    followed_id: Random.rand(1..10)
end
