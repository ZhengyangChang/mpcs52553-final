# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

usera = User.new
usera.login = "host"
usera.password = "secret1"
usera.save

userb = User.new
userb.login = "renter"
userb.password = "secret2"
userb.save

userc = User.new
userc.login = "renter2"
userc.password = "secret2"
userc.save

Host.delete_all

host = Host.new
host.name = "Jack"
host.email = "sample@sample.com"
host.phone = "123-456-7890"
host.user = usera
host.save

Renter.delete_all

renter = Renter.new
renter.name = "Sean"
renter.email = "sean@sample.com"
renter.phone = "908-765-4321"
renter.user = userb
renter.save

renter2 = Renter.new
renter2.name = "Tony"
renter2.email = "Tony@sample.com"
renter2.phone = "809-765-4322"
renter2.user = userc
renter2.save


House.delete_all

house = House.new
house.address = "5555 Ellis Ave"
house.start_date = "2017-06-11"
house.end_date = "2017-09-25"
house.rate = 800
house.number_of_bedrooms = 3
house.number_of_bathrooms = 2
house.host = host
house.save

Reservation.delete_all

reservation = Reservation.new
reservation.house = house
reservation.renter = renter
reservation.save

Message.delete_all

message = Message.new
message.body = "hi"
message.house = house
message.renter = renter
message.save





