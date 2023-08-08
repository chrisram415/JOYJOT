require 'faker'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying existing records of Dogwalk and Users..."

Dogwalk.destroy_all # if Rails.env.development?
User.destroy_all # if Rails.env.development?

puts "Done deleting.."

puts "Creating 8 new Users..."


# Sample data for users
users_data = [
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "John", email: "john@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Jane", email: "jane@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Sarah", email: "sarah@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Yann", email: "yann@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Chris", email: "chris@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Saki", email: "saki@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Alexia", email: "alexia@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Zhan", email: "zhan@example.com", password: "password" },
]

users_data.each do |user_info|
  User.create!(user_info)
end

puts "Now creating 8 new dogwalk listings..."



dogwalks_data = [
  { user_name: "Zhan", name: "eg1", image_url: "https://cdn.akc.org/content/article-body-image/funny-french_bulldog.jpg" },
  { user_name: "John", name: "eg2", image_url: "https://e0.pxfuel.com/wallpapers/349/338/desktop-wallpaper-of-dogs-making-funny-faces-cute-funny-dog.jpg" },
  { user_name: "Sarah", name: "eg3", image_url: "https://e0.pxfuel.com/wallpapers/43/340/desktop-wallpaper-funny-dog-funny-dog-cute-dogs-with-glasses.jpg" },
  { user_name: "Yann", name: "eg4", image_url: "https://e0.pxfuel.com/wallpapers/151/741/desktop-wallpaper-smiling-dog-dog-smiling-field-green-trees-cute-funny-tongue.jpg" },
  { user_name: "Chris", name: "eg5", image_url: "https://img.freepik.com/premium-photo/cute-funny-shih-tzu-breed-dog-outdoors-dog-grooming-funny-dog-city_357532-2947.jpg?w=2000" },
  { user_name: "Saki", name: "eg6", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrqHpbOUZi32jj4q2IifQxDUL-PZ9CQvoeRQ&usqp=CAU" },
  { user_name: "Alexia", name: "eg7", image_url: "https://i5.walmartimages.com/asr/b1c9258a-09ab-4067-a14f-8778bb192e6d.d879ec718ac734758789398eae06fd61.jpeg" },
  { user_name: "Jane", name: "eg8", image_url: "https://imgix.ranker.com/user_node_img/3832/76635002/original/menchi-photo-u3?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=375" },
]

dogwalks_data.each do |dogwalk_info|
  user = User.find_by(nickname: dogwalk_info[:user_name])

  # allow random duration within seeds
  options = [0.5, 1, 1.5, 2, 2.5, 3]

  # Use open-uri to download the image from the provided URL
  image_file = URI.open(dogwalk_info[:image_url])

  # Use Cloudinary's uploader to upload the image and get the secure URL
  # cloudinary_response = Cloudinary::Uploader.upload(image_file)

  # cloudinary_response = Cloudinary::Uploader.upload(file)

  # debugger

  dogwalk = Dogwalk.new(
    service_details: Faker::Quote.mitch_hedberg,
    dog_capacity: rand(1..5),
    neighborhood: Faker::Address.city,
    duration: options.sample,
    price_per_dog: rand(50..150),
    user: user,
    # photo: cloudinary_response['secure_url']
  )

  dogwalk.save!
  dogwalk.photo.attach(io: image_file, filename: "image.jpg")
end
