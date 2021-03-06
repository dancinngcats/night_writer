class Dictionary

  def eng_to_braille
    {
    "a" => "0.....",
    "b" => "0.0...",
    "c" => "00....",
    "d" => "00.0..",
    "e" => "0..0..",
    "f" => "000...",
    "g" => "0000..",
    "h" => "0.00..",
    "i" => ".00...",
    "j" => ".000..",
    "k" => "0...0.",
    "l" => "0.0.0.",
    "m" => "00..0.",
    "n" => "00.00.",
    "o" => "0..00.",
    "p" => "000.0.",
    "q" => "00000.",
    "r" => "0.000.",
    "s" => ".00.0.",
    "t" => ".0000.",
    "u" => "0...00",
    "v" => "0.0.00",
    "w" => ".000.0",
    "x" => "00..00",
    "y" => "00.000",
    "z" => "0..000",
    "1" => "0.....",
    "2" => "0.0...",
    "3" => "00....",
    "4" => "00.0..",
    "5" => "0..0..",
    "6" => "000...",
    "7" => "0000..",
    "8" => "0.00..",
    "9" => ".00...",
    "0" => ".000..",
    " " => "......"
    }
  end

  def braille_to_eng
    eng_to_braille.invert
  end

end

# take the entire input file and save it to the output file, no translation
# Create a dictionary
# Update your program to translate a single letter
# Update your program for multiple letters
# messages of more than 80 characters are split over multiple lines.
