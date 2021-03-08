require_relative 'translator'
input_file = File.open(ARGV[0], "r")


incoming_text = input_file.read.chomp

translator = Translator.new(incoming_text)

output_file = File.open(ARGV[1], "w")

output_file.write(translator.braille_it)

stripped_count = translator.braille_it.delete("\n")

count = stripped_count.size

file_name = ARGV[1]

puts "Created #{file_name} containing #{count} characters"
