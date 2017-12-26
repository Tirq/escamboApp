# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [ "Animais e acessórios",
			   		 	 "Esportes",
			   		 	 "Para a sua casa",
			   		 	 "Eletrônicos e celulares",
			   		 	 "Música e hobbies",
			   		 	 "Bebês e crianças",
			   		 	 "Moda e beleza",
			   		 	 "Veículos e barcos",
			   		 	 "Imóveis",
			   			 "Empregos e negócios" ]

puts "Creating categories"
categories.each { |c|
	Category.find_or_create_by( description: c)
}
puts "Successful to Create categories!"