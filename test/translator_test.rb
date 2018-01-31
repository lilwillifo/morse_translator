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

  #if time, test for edge cases - capital letters, nonstring
  def test_eng_to_morse_returns_morse
    morse = @translator.eng_to_morse("hello world")
    morse2 = @translator.eng_to_morse("marg")
    assert_equal "......-...-..--- .-----.-..-..-..", morse
    assert_equal "--.-.-.--.", morse2
  end

end
