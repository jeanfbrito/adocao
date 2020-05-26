# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'jeanfbrito@gmail.com', password: '123123123')

10.times do
  Animal.create(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    kind: :dog,
    gender: Animal.gender.options.sample,
    size: Animal.size.options.sample,
    birth: Faker::Date.between(from: 15.years.ago, to: Date.today),
    city: Animal.city.options.sample,
    user: user
  )
end

3.times do
  Animal.create(
    name: Faker::Creature::Cat.name,
    breed: Faker::Creature::Cat.breed,
    kind: :cat,
    gender: Animal.gender.options.sample,
    size: Animal.size.options.sample,
    birth: Faker::Date.between(from: 15.years.ago, to: Date.today),
    city: Animal.city.options.sample,
    user: user
  )
end
