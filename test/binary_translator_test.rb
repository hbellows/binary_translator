require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_translator'

class BinaryTranslatorTest < Minitest::Test
  def test_it_exists
    bt = BinaryTranslator.new

    assert_instance_of BinaryTranslator, bt
  end

  def test_it_can_translate_the_a_single_letter
    bt = BinaryTranslator.new

    assert_equal "000001", bt.translate("a")
    assert_equal "011010", bt.translate("z")
  end

  def test_it_can_transalte_a_word
    bt = BinaryTranslator.new

    result = "010100010101010010001001001110000111"

    assert_equal result, bt.translate("turing")
  end

  def test_it_can_translate_capital_letters
    bt = BinaryTranslator.new

    assert_equal "000001", bt.translate("a")
    assert_equal "000001", bt.translate("A")

    result = "010100010101010010001001001110000111"

    assert_equal result, bt.translate("TURING")
  end

  def test_it_can_translate_a_space
    bt = BinaryTranslator.new

    assert_equal "000000", bt.translate(" ")
  end

  def test_it_can_ignore_character_symbols
    bt = BinaryTranslator.new

    assert_equal "", bt.translate("!@{$#%^&*()}")
  end

  def test_it_can_translate_a_simple_sentence
    bt = BinaryTranslator.new

    result = "001000000101001100001100001111000000010111001111010010001100000100"

    assert_equal result, bt.translate("Hello World!")
  end

end
