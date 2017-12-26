namespace :dev do

desc 'Initial setup for dev enviroment'
	task setup: :environment do
		puts "Starting initial setup for dev enviroment"	
		puts "DB drop ... #{%x(rake db:drop)}"
		image_file = Rails.root.join('public','system')
		puts "Image Files drop ... #{%x( rm -rf  #{image_file} )}"

		puts "DB create ... #{%x(rake db:create)}"
		puts "DB migrate ... #{%x(rake db:migrate)}"
		puts "DB seed ... #{%x(rake db:seed)}"
		puts %x(rake dev:generate_admins)
		puts %x(rake dev:generate_members)
		puts %x(rake dev:generate_ads)

		puts "initial setup for dev enviroment done! "
	end

	desc 'Generate Admin users'
	task generate_admins: :environment do
		puts "Generating admin users"	

		Admin.create!(name: "Tiago",
	 							email: "ti@gmail.com", 
	 							password: "123456",
	 							password_confirmation: "123456",
	 							role: 1)
	Admin.create!(name: "Gisele",
	 							email: "gi@gmail.com", 
	 							password: "123456",
	 							password_confirmation: "123456",
	 							role: 0)
	puts "Admin user generated! "
	end

	desc 'Generate Members'
	task generate_members: :environment do
		puts 'Generating members'
			Member.create!( email: "member@gmail.com", 
	 							   password: "123456",
	 							   password_confirmation: "123456" )

			100.times do
				Member.create!(
								email: Faker::Internet.email, 
	 							password: "123456",
	 							password_confirmation: "123456",	
				)
			end	
		puts 'Members generated'
	end

	desc 'Generate Ads'
	task generate_ads: :environment do
		puts 'Generating ads...'
		
		10.times do 
			Ad.create!(
			title: Faker::Coffee.blend_name,
      description: Faker::Coffee.notes,
      category: Category.all.sample,
      member: Member.first,
      finish_date: Date.today + Random.rand(90),
      price: "#{Random.rand(200)},#{Random.rand(99)}" ,
      image: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(1..6)}.jpeg"), 'r')
		  )
		end	

		100.times do 
			Ad.create!(
			title: Faker::Coffee.blend_name,
      description: Faker::Coffee.notes,
      category: Category.all.sample,
      member: Member.all.sample,
      finish_date: Date.today + Random.rand(90),
      price: "#{Random.rand(200)},#{Random.rand(99)}" ,
      image: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(1..6)}.jpeg"), 'r')
		  )
		end	
		
		puts 'Ads generated ...'
	end

end