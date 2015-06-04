class Encrypt


  def rotate(message, key, map = get_character_map)
    counter = 0
    message.length.times do |index|
      map_index = find_match(message[index])
      if map_index == false
        message[index] = message[index]
      else
        message[index] = map[(map_index + key[counter]) % 39 ]
      end
      counter += 1
      if counter >= 3
        counter = 0
      end
    end

    return message
  end


  def rotate_back(message, key, map = get_character_map)
    counter = 0
    message.length.times do |index|
      map_index = find_match(message[index])
      if map_index == false
        message[index] = message[index]
      else
        message[index] = map[(map_index - key[counter]) % 39]
      end
      counter += 1
      if counter >= 3
        counter = 0
      end
    end

    return message
  end


  def get_character_map
    map = "abcdefghijklmnopqrstuvwxyz0123456789,. "
    return map
  end

  def find_match(letter)
    map = get_character_map
    map.length.times do |index|
      if letter == map[index]
        return index
      end
    end
    return false
  end


end
