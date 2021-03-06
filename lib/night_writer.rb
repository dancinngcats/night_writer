input_file = File.open(ARGV[0], "r")

# input
incoming_text = input_file.read

# logic that will handle translation
# determine which filter to use - to english or to braille?
# this will have an output "to English "

output_file = File.open(ARGV[1], "w")

output_file.write(incoming_text)

# what the output file count of characters will be
count = incoming_text.chars.count

file_name = ARGV[1]

puts "Created #{file_name} containing #{count} characters"
