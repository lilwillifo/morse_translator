require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/translator.rb'

class TranslatorTest < Minitest::Test

  def setup
    @translator = Translator.new
  end

  def test_translator_exists
    assert_instance_of Translator, @translator
  end

  def test_eng_to_morse_returns_string
    morse = @translator.eng_to_morse("Hello World")
    assert_instance_of String, morse
  end

  #if time, test for edge case - nonstring input
  def test_eng_to_morse_returns_morse
    morse = @translator.eng_to_morse("hello world")
    morse2 = @translator.eng_to_morse("marg")
    assert_equal "......-...-..--- .-----.-..-..-..", morse
    assert_equal "--.-.-.--.", morse2
  end

  def test_eng_to_morse_works_with_capitalization
    morse = @translator.eng_to_morse("Hello World")
    morse2 = @translator.eng_to_morse("HeLLo wOrLd")
    assert_equal "......-...-..--- .-----.-..-..-..", morse
    assert_equal morse, morse2
  end

  def test_eng_to_morse_works_with_numbers
    morse = @translator.eng_to_morse("There are 3 ships")
    assert_equal "-......-.. .-.-.. ...-- ..........--....", morse
  end

  def test_read_file
    morse = @translator.read_file("./data/input.txt")
    assert_instance_of String, morse
    assert_equal "I am in a file", morse
  end

  def test_from_file
    morse = @translator.from_file("./data/input.txt")
    assert_equal ".. .--- ..-. .- ..-....-...", morse
  end

  def test_morse_to_eng
    eng = @translator.morse_to_eng(".... . .-.. .-.. ---  .-- --- .-. .-.. -..")
    assert_equal "hello world", eng
  end

end
