require_relative 'html_generator'

request = ARGV[0]
generator = HtmlGenerator.new

if request == "guilty-time"
	generator.feeling_guilty

elsif request == "random-drink"
	generator.random_drink

elsif request == "pick-type"
	search_text = ARGV[1]
	generator.pick_type(search_text)

elsif request == "help"
	generator.help

else
	puts "Sorry, I can not compute."
end

