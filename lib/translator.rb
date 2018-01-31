require 'pry'

class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = {"a" => ".-",
                    "b" => "-...",
                    "c" => "-.-.",
                    "d" => "-..",
                    "e" => ".",
                    "f" => "..-.",
                    "g" => "--.",
                    "h" => "....",
                    "i" => "..",
                    "j" => ".---",
                    "k" => "-.-",
                    "l" => ".-..",
                    "m" => "--",
                    "n" => "-.",
                    "o" => "---",
                    "p" => ".--.",
                    "q" => "--.-",
                    "r" => ".-.",
                    "s" => "...",
                    "t" => "-",
                    "u" => "..-",
                    "v" => "...-",
                    "w" => ".--",
                    "x" => "-..-",
                    "y" => "-.--",
                    "z" => "--..",
                    "1" => ".----",
                    "2" => "..---",
                    "3" => "...--",
                    "4" => "....-",
                    "5" => ".....",
                    "6" => "-....",
                    "7" => "--...",
                    "8" => "---..",
                    "9" => "----.",
                    "0" => "-----",
                    " " => " "}
  end


  def eng_to_morse(string)
    morse_array = string.downcase.chars.map do |char|
      @dictionary[char]
    end
    morse_array.join
  end

  def from_file(filename)
    string = read_file(filename)
    eng_to_morse(string)
  end

  def read_file(filename)
    File.open(filename, "r").read.chomp
  end

  def morse_to_eng(morse)
    words_array = morse.split("  ")
    # returns ["word 1 in morse", "word 2 in morse"]
      english = words_array.map do |word|
      char_array = word.split.map do |char|
        @dictionary.key(char)
      end
      char_array.join
    end
    english.join(" ")
    end

end
