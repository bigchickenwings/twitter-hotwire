# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(email: 'john@test.com', password: 'secret_password')
user2 = User.create(email: 'jane@test.com', password: 'secret_password')

tweet1 = user1.tweets.create(body: 'I am the first user!')
tweet2 = user1.tweets.create(body: 'I love to tweet!')
tweet3 = user1.tweets.create(body: '3rd tweet!')

tweet4 = user2.tweets.create(body: 'Damn I am the second user!')
tweet5 = user2.tweets.create(body: 'I love mashed potatoes')

user1.likes.create({ tweet: tweet1 }, { tweet: tweet2 }, { tweet: tweet4 }, { tweet: tweet5 })
user2.likes.create({ tweet: tweet2 }, { tweet: tweet5 })