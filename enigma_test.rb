require 'minitest/autorun'
require 'minitest/pride'
require_relative 'runner'
require_relative 'key_generator'
require_relative 'offset'
require_relative 'input_output'
require_relative 'encrypt'

class EnigmaTest < Minitest::Test

  def test_it_has_a_runner_class
    assert Runner.new(), 'There should be a runner class in your program'
  end

  def test_it_has_a_generator_class
    assert Generator.new(), 'There should be a key-generator class in your program'
  end

  def test_it_has_an_offset_class
    assert OffsetCalculator.new(), 'There should be a key-generator class in your program'
  end

  def test_it_has_a_file_reader_and_writer_class
    assert FileManipulation.new(), 'There should be a class to manipulate your files in your program'
  end

  def test_it_has_an_encryption_class
    assert Encrypt.new(), 'There should be a class to encrypt and decrypt your file'
  end

  def test_runner_class_retrieves_correct_time
    assert_equal "010100", Runner.new.get_time(Time.utc(2000, "jan", 1, 20, 15, 1)), 'The date must be in this format for future use'
  end

  def test_file_reader_reads_file_into_array
    assert_equal "hello!", FileManipulation.new.reader("test.txt"), 'The file should be read and then put into an array'
  end

  def test_square_date_in_offset_class
    assert_equal 937278225, OffsetCalculator.new.square_date("030615"), 'this should square the date and return the last 4 digits of the result'
  end

  def test_squared_date_format_in_offset_class
    assert_equal "8225", OffsetCalculator.new.format_squared_results(937278225), 'this should square the date and return the last 4 digits of the result'
  end

  def test_combine_method_in_offset_class
    assert_equal [43, 47, 58, 72], OffsetCalculator.new.combine([3, 4, 5, 6, 7], [9, 2, 2, 5])
  end

  def test_character_map_has_correct_values
    assert_equal "abcdefghijklmnopqrstuvwxyz0123456789,. ",
                 Encrypt.new.get_character_map, 'the character map has to have the correct values'
  end

  def test_rotate_method_with_less_than_four
    assert_equal " dp", Encrypt.new.rotate(",bn", [2, 2, 2, 2])
  end

  def test_rotate_method_with_more_than_four
    assert_equal "cie fg6cbd", Encrypt.new.rotate("afd,cf4 ab", [2, 3, 1, 0])
  end

  def test_find_match_method
    assert_equal 0, Encrypt.new.find_match("a")
  end

  def test_rotate_back_method_with_less_than_four
    assert_equal "8 l", Encrypt.new.rotate_back(",bn", [2, 2, 2, 2])
  end

  def test_rotate_back_method_with_more_than_four
    assert_equal ".cc8 e29  ", Encrypt.new.rotate_back("afd,cf4 ab", [2, 3, 1, 0])
  end


end