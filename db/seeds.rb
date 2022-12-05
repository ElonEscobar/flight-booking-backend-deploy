Flight.destroy_all
User.destroy_all

u1 = User.create(first_name: "John", last_name: "Doe", email: "j@doe.com",
gender: "Male", age: 20)
u2 = User.create(first_name: "Jane", last_name: "Doe", email: "j@doe.com", gender: "Female", age: 29)
u3 = User.create(first_name: "Sam", last_name: "Kimani", email: "samk@doe.com", gender: "Male", age: 26)

f1 = Flight.create(user_id: u1.id, destination: "Nairobi", departure: "Mombasa", flight_date: 2022-12-01)
f2 = Flight.create(user_id: u2.id, destination: "Kisumu", departure: "Mombasa", flight_date: 2022-12-05)
f3 = Flight.create(user_id: u1.id, destination: "Nyeri", departure: "Thika", flight_date: 2022-12-03)


