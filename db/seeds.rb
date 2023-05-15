# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# student = Student.create(
# 	first_name: "Ravi",
# 	last_name: "Singh",
# 	email: "ravi@gmail.com"
# 	)
# student = Student.new(
# 	first_name: "Ravi",
# 	last_name: "Singh",
# 	email: "ravi@gmail.com"
# 	)

# student.save

20.times do |i|
	puts "creating student #{i+1}"
	Student.create(
		first_name: "student #{i+1}",
		last_name: "l_name #{i+1}",
		email: "student#{i+1}@gmail.com"
		)
end

Student.all.each do |student|
	student.blogs.create(title: "Dummy Blog for student #{student.id}", content: "Custom content pending")
	student.blogs.create(title: "Dummy Blog for student #{student.id}", content: "Custom content pending")
end