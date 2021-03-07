require_relative 'translator'
input_file = File.open(ARGV[0], "r")

# input
incoming_text = input_file.read

# logic that will handle translation
# determine which filter to use - to english or to braille?
# this will have an output_file
translator = Translator.new(incoming_text)

output_file = File.open(ARGV[1], "w")

output_file.write(translator.braille_it)

# what the output file count of characters will be
stripped_count = translator.braille_it.delete("\n")

count = stripped_count.size

file_name = ARGV[1]

puts "Created #{file_name} containing #{count} characters"
