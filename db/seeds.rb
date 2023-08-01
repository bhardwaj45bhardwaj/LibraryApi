 # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..10).each do |i|
	name = "test_user" + i.to_s
	book_name = "book" + i.to_s
	uid = "123456789" + i.to_s
	User.create(name: name, email: "#{name}@gmail.com", address: "Pune")
	Book.create(name: book_name, author: "author", published_date: DateTime.now, uid: uid)
	
end

