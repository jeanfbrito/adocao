require 'open-uri'

dog_picture_urls = [
  'https://www.guidedogs.org/wp-content/uploads/2019/11/website-donate-mobile.jpg',
  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/smartest-dog-breeds-1553287693.jpg',
  'https://www.dogstrust.org.uk/help-advice/_images/164742v800_puppy-1.jpg',
  'https://www.cesarsway.com/wp-content/uploads/2019/10/AdobeStock_190562703.jpeg',
  'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/slideshows/dog_breed_health_issues_slideshow/1800x1200_dog_breed_health_issues_slideshow.jpg'
]

cat_picture_urls = [
  'https://conteudo.imguol.com.br/c/noticias/e2/2019/11/26/ninhada-de-cinco-gatinhos-da-raca-maine-coon-tem-feicoes-ranzinzas-1574796216525_v2_450x450.jpg',
  'https://www.agenciabrasilia.df.gov.br/wp-conteudo/uploads/2017/01/gato-animais-domesticos-adocao-zoonose-gabriel-jabur--1024x683.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/1/1a/Black_cat_in_Pamukkale%2C_Turkey.jpg'
]

user = User.create(email: 'jeanfbrito@gmail.com', password: '123123123')

10.times do
  dog = Animal.create(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    kind: :dog,
    gender: Animal.gender.options.sample.last,
    size: Animal.size.options.sample.last,
    birth: Faker::Date.between(from: 15.years.ago, to: Date.today),
    city: Animal.city.options.sample.last,
    user: User.first
  )
  downloaded_image = open(dog_picture_urls.sample)
  dog.pictures.attach(io: downloaded_image, filename: "#{dog.id}#{Time.now.to_i}.jpg")
end

3.times do
  cat = Animal.create(
    name: Faker::Creature::Cat.name,
    breed: Faker::Creature::Cat.breed,
    kind: :cat,
    gender: Animal.gender.options.sample.last,
    size: Animal.size.options.sample.last,
    birth: Faker::Date.between(from: 15.years.ago, to: Date.today),
    city: Animal.city.options.sample.last,
    user: User.first
  )
  downloaded_image = open(cat_picture_urls.sample)
  cat.pictures.attach(io: downloaded_image, filename: "#{cat.id}#{Time.now.to_i}.jpg")
end
