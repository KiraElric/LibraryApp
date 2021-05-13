# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Publisher.destroy_all

# 20.times do
#   publisher = Publisher.create!(name: Faker::Book.publisher)
#   puts "Publisher: #{publisher.id}"
# end

20.times do
  first_name, last_name = Faker::Book.author.split(' ')
  author = Author.create!(first_name: first_name, 
                          last_name: last_name
                        )

  puts "Author: #{author.full_name}"
end