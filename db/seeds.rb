# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying existing records of Joy and Users..."

Joy.destroy_all # if Rails.env.development?
Game.destroy_all
User.destroy_all # if Rails.env.development?

puts "Done deleting.."

puts "Creating 8 new Users..."


users_data = [
  { email: "john@example.com", password: "password", nickname: Faker::Artist.name, age: Faker::Number.between(from: 12, to: 85), gender: ['dude', 'dudette'].sample, location: Faker::Address.city },
  { email: "jane@example.com", password: "password", nickname: Faker::Artist.name, age: Faker::Number.between(from: 12, to: 85), gender: ['dude', 'dudette'].sample, location: Faker::Address.city },
  { email: "sarah@example.com", password: "password", nickname: Faker::Artist.name, age: Faker::Number.between(from: 12, to: 85), gender: ['dude', 'dudette'].sample, location: Faker::Address.city },
  { email: "yann@example.com", password: "password", nickname: Faker::Artist.name, age: Faker::Number.between(from: 12, to: 85), gender: ['dude', 'dudette'].sample, location: Faker::Address.city },
  { email: "chris@example.com", password: "password", nickname: Faker::Artist.name, age: Faker::Number.between(from: 12, to: 85), gender: ['dude', 'dudette'].sample, location: Faker::Address.city },
  { email: "saki@example.com", password: "password", nickname: Faker::Artist.name, age: Faker::Number.between(from: 12, to: 85), gender: ['dude', 'dudette'].sample, location: Faker::Address.city },
  { email: "alexia@example.com", password: "password", nickname: Faker::Artist.name, age: Faker::Number.between(from: 12, to: 85), gender: ['dude', 'dudette'].sample, location: Faker::Address.city },
  { email: "zhan@example.com", password: "password", nickname: Faker::Artist.name, age: Faker::Number.between(from: 12, to: 85), gender: ['dude', 'dudette'].sample, location: Faker::Address.city }
]
# a user has many joys, many games, and may reccomendations
users_data.each do |user_info|
  User.create!(user_info)
end

# create joy data, 1 joy per user w/ an image for that joy
joy_data = [
  { email: "john@example.com", image_url: "https://cdn.akc.org/content/article-body-image/funny-french_bulldog.jpg" },
  { email: "jane@example.com", image_url: "https://e0.pxfuel.com/wallpapers/349/338/desktop-wallpaper-of-dogs-making-funny-faces-cute-funny-dog.jpg" },
  { email: "sarah@example.com", image_url: "https://e0.pxfuel.com/wallpapers/43/340/desktop-wallpaper-funny-dog-funny-dog-cute-dogs-with-glasses.jpg" },
  { email: "yann@example.com", image_url: "https://e0.pxfuel.com/wallpapers/151/741/desktop-wallpaper-smiling-dog-dog-smiling-field-green-trees-cute-funny-tongue.jpg" },
  { email: "chris@example.com", image_url: "https://img.freepik.com/premium-photo/cute-funny-shih-tzu-breed-dog-outdoors-dog-grooming-funny-dog-city_357532-2947.jpg?w=2000" },
  { email: "saki@example.com", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrqHpbOUZi32jj4q2IifQxDUL-PZ9CQvoeRQ&usqp=CAU" },
  { email: "alexia@example.com", image_url: "https://i5.walmartimages.com/asr/b1c9258a-09ab-4067-a14f-8778bb192e6d.d879ec718ac734758789398eae06fd61.jpeg" },
  { email: "zhan@example.com", image_url: "https://imgix.ranker.com/user_node_img/3832/76635002/original/menchi-photo-u3?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=375" },
]


puts "Creating 1 game per player..."
puts "Now creating 1 new Joy per user User..."
# Create Joys
# create joy (contains user and game) a joy belongs to a user and a joy nelongs to a game
# Create Games
# create a game, a game belongs to a user and a game has many joys

joy_data.each do |joy_info|
  p joy_info[:image_url]
  p user = User.find_by(email: joy_info[:email])
  new_game = Game.create!(user_id: user.id)

  # Use open-uri to download the image from the provided URL
  # image_file = URI.open(joy_info[:image_url])
  joy = Joy.new(
    description: Faker::Hobby.activity,
    rating: Faker::Number.between(from: 1, to: 5),
    fortune: Faker::TvShows::Spongebob.quote,
    genre: Faker::Music.genre,
    user_id: user.id
  )
  # save joy plus add images
  joy.save!


  # joy.photo.attach(io: image_file, filename: "image.jpg")

  # Create Gamecards for the Joy
  gamecard = Gamecard.new(
    solved: [true, false].sample,
    joy_id: joy.id,
    game_id: new_game.id,
    image_url: ""
  )
  gamecard.save!
  # gamecard.photo.attach(io: image_file, filename: "image.jpg")


  # Create Recommendations
  Recommendation.create!(
    activity: "Hello! Let's create a joy-filled weekend just for you! Since your collection is empty this week, let's dive into activities that might light up your spirit:

    Sunset Adventure 🌅🚴‍♂️: Bike to a scenic spot and savor the sunset, embracing your love for adventure and natural beauty.

    Cooking Fiesta 🍳🎉: Whip up a delicious meal, indulging your joy in culinary creativity!

    Wishing you a weekend brimming with happiness! 🌈😊",
    rating: Faker::Number.between(from: 0, to: 5),
    genre: Faker::Music.genre,
    user_id: user.id,
  )

  puts "Creating..."
end

puts "finished!"
