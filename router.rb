require_relative 'html_generator'

request = ARGV[0]
generator = HtmlGenerator.new

if request == "guilty-time"
	generator.feeling_guilty

else
	puts "Sorry, I do not compute."
end

