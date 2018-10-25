# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


pablo = User.create(first_name: 'pablo', last_name: 'argueta', username: 'pablotest', password: '123456', email: 'pabloTest@gmail.com', horoscope: 'Gemini')

pablo.profile = Profile.create()
# pablo.avatar.attach('/assets/images/defaultProfile.png')

all_horoscopes = ['Aries', 'Libra', 'Taurus', 'Scorpio', 'Gemini', 'Sagittarius', 'Cancer', 'Capricorn', 'Leo', 'Aquarius', 'Virgo', 'Pisces']

i = 200

while i > 0 do
firstName = Faker::Name.first_name
lastName = Faker::Name.last_name
username = "#{firstName.downcase!}#{lastName.downcase!}"
user = User.create(first_name: firstName, last_name: lastName, username: username, password: '123456', email: Faker::Internet.email(username), horoscope: all_horoscopes.sample)

user.profile = Profile.create()

i -= 1

end