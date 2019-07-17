# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

1.times do
  User.create(
    name: 'Hugo',
    username: 'admin',
    email: 'admin@test.com',
    password: 'azertyuiop'
  )
end

10.times do
  User.create(
    name: Faker::Name.name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

10.times do
  Category.create(label: Faker::Book.genre)
end

100.times do
  @type = Faker::Boolean.boolean ? 'content' : 'link'
  post = Post.create(
    title: Faker::Book.title,
    content: @type == 'content' ? Faker::Lorem.paragraph(20) : Faker::Internet.url,
    post_type: @type,
    published: Faker::Boolean.boolean,
    user_id: Faker::Number.between(1, 10),
    category_id: Faker::Number.between(1, 10)
  )

  Faker::Number.between(1, 10).times do
    Upvote.create(
      user_id: Faker::Number.between(1, 10),
      post_id: post.id
    )
  end

  Faker::Number.between(1, 10).times do
    Comment.create(
      message: Faker::Lorem.paragraph,
      post_id: post.id,
      user_id: Faker::Number.between(1, 10)
    )
  end
end
