Flight.destroy_all
User.destroy_all
puts "Start Seeding..."

u1 = User.create(first_name: "John", last_name: "Doe", email: "j@doe.com", gender: "Male", age: 20, password: "johnte", password_confirmation: "johnte")
u2 = User.create(first_name: "Jane", last_name: "Doe", email: "jan@doe.com", gender: "Female", age: 29, password: "janney", password_confirmation: "janney")
u3 = User.create(first_name: "Sam", last_name: "Kimani", email: "samk@doe.com", gender: "Male", age: 26, password: "samm@2", password_confirmation: "samm@2")

f1 = Flight.create(user_id: u1.id, destination: "Nairobi", departure: "Mombasa", flight_date: 20221201)
f2 = Flight.create(user_id: u2.id, destination: "Kisumu", departure: "Mombasa", flight_date: 20221205)
f3 = Flight.create(user_id: u1.id, destination: "Nyeri", departure: "Thika", flight_date: 20221203)

puts "Seeding Complete!!!"

