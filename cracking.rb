require_relative 'input_output'
require_relative 'encrypt'
require_relative 'offset'
require_relative 'encrypt'
class Cracker


  def crack
    file = read_enemy_file
    key = subtract_date(look_for_end(file))
    decrypt(key, file)

  end

  def get_map
    map = Encrypt.new.get_character_map
    return map
  end

  def read_enemy_file(enemy_file = "enemy_encrypted.txt")
    file_manipulate =FileManipulation.new
    return file_manipulate.reader(enemy_file)
  end

  def look_for_end(message)
    #nd..
    key_A = 37 - find_current(message[-7])
    key_B = 37 - find_current(message[-6])
    key_C = 4 - find_current(message[-5])
    key_D = 13 - find_current(message[-4])
    puts "array key is #{[key_A, key_B, key_C, key_D]}"
    return [key_A, key_B, key_C, key_D]
  end

  def subtract_date(key_array)
    date = OffsetCalculator.new.format_squared_results
    puts "date is #{date}"
    key_array.size.times do |index|
      key_array[index] = key_array[index] - date[index].to_i
    end
    puts "array key minus date is #{key_array}"
    return key_array
  end


  def decrypt(key_array, message)
    solution = Encrypt.new.rotate_back(message, key_array)
    puts solution.inspect
  end

  def find_current(letter)
    map = get_map

    map.size.times do |index|
      if letter == map[index]
        return index
      end

    end

  end

  def find_distance_to_correct_letter(letter)

    map = get_map

    map.size.times do |index|
      if letter == map[index]
        return index
      end

    end

  end


end



Cracker.new.crack