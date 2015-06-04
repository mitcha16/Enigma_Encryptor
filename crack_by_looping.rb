require_relative 'input_output'
require_relative 'encrypt'
require_relative 'offset'
require_relative 'encrypt'
class Cracker

  def read_enemy_file(enemy_file = "enemy_encrypted.txt")
    file_manipulate =FileManipulation.new
    return file_manipulate.reader(enemy_file)
  end

  def beat_it_into_working()
    message = read_enemy_file
    #need to add date

    offset = OffsetCalculator.new
    key = 0
    while message[-7..-1] != "..end.."
      message = read_enemy_file
      test_key = pad(key)
      key_array = offset.create_ABCD_rotation(test_key)
      answer = decrypt(key_array, message)

      print key_array
      puts answer

      key += 1

    end

    puts answer
  end


  def decrypt(key_array, message)
    return Encrypt.new.rotate_back(message, key_array)
  end


  def pad(num)

    if num.to_s.length <= 5
      padded = num.to_s.rjust(5, "0")

    end
    return padded

  end

end


Cracker.new.beat_it_into_working
