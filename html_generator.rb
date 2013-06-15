	require 'open-uri'
	require 'json'
	
class HtmlGenerator
	WATER = 3.5
	
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

end
