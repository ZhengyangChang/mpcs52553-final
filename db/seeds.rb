# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Host.delete_all
Renter.delete_all
Users = [["u1@u.com","s1",0,"Jack","123-456-7891"],
["u2@u.com","s2",1,"Sean","472-472-4651"],
["u3@u.com","s3",1,"Tony","752-472-5739"],
["zhengyangc@uchicago.edu","qwerty",0,"Zhengyang","872-904-8001"]]

Users.map do |entry|
  user = User.new
  user.email = entry[0]
  user.password = entry[1]
  if entry[2] == 0
    host = Host.new
    host.name = entry[3]
    host.phone = entry[4]
    host.user = user
    user.host = host
    user.save
    host.save
  else
    renter = Renter.new
    renter.name = entry[3]
    renter.phone = entry[4]
    renter.user = user
    user.renter = renter
    user.save
    renter.save
  end
end

House.delete_all

houses =[["Young","5555 Ellis Ave","Room 306", "2017-06-11", "2017-09-25",800,3,2,"Jack"],
["Regents Park","5050 S Lake Shore Dr", "APT 1502S", "2017-06-12", "2017-09-08",600,2,1,"Zhengyang"],
["Regents Park","5050 S Lake Shore Dr", "APT 2502S", "2017-06-12", "2017-09-08",600,3,3,"Zhengyang"],
["Regents Park","5050 S Lake Shore Dr", "APT 2006S", "2017-06-12", "2017-09-08",600,2,2,"Zhengyang"],
["Regents Park","5050 S Lake Shore Dr", "APT 3401S", "2017-06-12", "2017-09-08",600,3,1,"Zhengyang"],
["UPC","Where ever", "APT 1502S", "2017-06-12", "2017-09-08",600,2,1,"Zhengyang"],
["Regents Park","5050 S Lake Shore Dr", "APT 1501S", "2017-06-12", "2017-09-08",600,2,1,"Zhengyang"]

]
houses.map do |entry|
  house = House.new
  house.building_name = entry[0]
  house.address = entry[1]
  house.room = entry[2]
  house.start_date = entry[3]
  house.end_date = entry[4]
  house.rate = entry[5]
  house.number_of_bedrooms = entry[6]
  house.number_of_bathrooms = entry[7]
  house.host = Host.find_by(name: entry[8])
  house.save
end


Reservation.delete_all

reservation = Reservation.new
reservation.house = House.sample
reservation.renter = Renter.sample
reservation.save

Message.delete_all

message = Message.new
message.body = "hi"
message.house = House.sample
message.renter = Renter.sample
message.save





