require_relative 'html_generator.rb'


if ARGV.empty?
  puts "Usage: ruby router.rb [action]" #more help text later
else 
  action=ARGV[0]
  generator=ProductQuery.new

  if action=="index"
    generator.index
  elsif action=="show"
    puts "Usage: Show ProductID" if ARGV[1].nil?
    generator.show(ARGV[1]) unless ARGV[1].nil?
  else 
    puts "Unknown action, use index or show"
  end
end
