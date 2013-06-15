	require 'open-uri'
	require 'json'

class HtmlGenerator
	# cost to help get clean water to those in need in Africa http://waterwellsforafrica.org/whats-the-cost/
	WATER = 3.5

	def print_header
		puts "<!DOCTYPE html>"
		puts "<html>"
		puts "		<head></head>"
		puts "		<body>"
	end

	def print_end
		puts "		</body>"
		puts "</html>"
	end

	def feeling_guilty
	raw_data = open("http://lcboapi.com/products?q=ontario").read
	ontario_drinks = JSON.parse(raw_data)

	print_header

		ontario_drinks["result"].each do |attribute|
			if attribute["price_in_cents"] >= 1000
				puts "				<h1> #{attribute["name"]} </h1>"
				puts "				<h4> $#{attribute["price_in_cents"]/100.to_f} <h4>"
				puts "				<h4> #{((attribute["price_in_cents"]/100.to_f)/WATER).to_i} people<h4>"
			else
				next
			end
		end
		print_end
	end

	def random_drink
		raw_data = open("http://lcboapi.com/products").read
		random_drinks = JSON.parse(raw_data)

		print_header

		random_drink = random_drinks["result"].sample
			puts "				<img src='#{random_drink["image_url"]}' style='height:200px; width:200px;'/>"
			puts "				<h1> Name: #{random_drink["name"]} </h1>"
			puts "				<h4> Package: #{random_drink["package"]} </h4>"
			puts "				<h4> Total package units: #{random_drink["total_package_units"]} </h4>"
			puts "				<h4> Price: $#{random_drink["price_in_cents"]/100.to_f} </h4>"

		print_end
	end


	def pick_type(type)
		raw_data = open("http://lcboapi.com/products?q=#{type}").read
		type_drinks = JSON.parse(raw_data)

		print_header

		type_drinks["result"].each do |attribute|
			puts "				<h1> Name: #{attribute["name"]} </h1>"
			puts "				<h4> Package: #{attribute["package"]} </h4>"
			puts "				<h4> Total package units: #{attribute["total_package_units"]} </h4>"
			puts "				<h4> Price: #{attribute["price_in_cents"]/100.to_f} </h4>"
			puts "				<h4> Area: #{attribute["origin"]} </h4>"

		print_end
		end
	end

	def help
		puts ""
		puts "Need help with the commands? No problemo!"
		puts "That's why I'm here brejo! (that's a soft 'j' btw)"
		puts "--------------------------------------------------------------"
		puts "--------------------------------------------------------------"
		puts ""
		puts "'guilty-time' ................ Feel bad for buying alcohol"
		puts "'random-drink' ............... Need help picking a drink? Try this!"
		puts "'pick-type' + _word_ ......... Have a specific query? Enter your word after 'pick-type'"
		puts "'help' ....................... If you made it here, you already know this"
		puts ""
		puts ""
	end

end
