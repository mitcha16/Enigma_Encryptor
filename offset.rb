require_relative 'key_generator'

class OffsetCalculator

  def get_time(time = Time.new)
    return time.strftime("%d%m%y")
  end


  def square_date(date = get_time)
    squared = date.to_i ** 2
    return squared
  end


  def format_squared_results(squared_date = square_date)
    last_4 = squared_date.to_s[-4..-1]
    return last_4
  end

  def input_key(input)

    key = input
    if key.length != 5
      return format_user_input_key(Generator.new.generate.chars)
    else
      format_user_input_key(key.chars)
    end
  end

  def format_user_input_key(key_array)
    key_array
    integer_array = key_array.map do |num|
      num.to_i
    end
    key_total = combine(integer_array, date = format_squared_results)
    return key_total
  end

  def combine (key, date)
    rotation_array = create_ABCD_rotation(key)
    add_date_to_rotation(rotation_array, date)
    return rotation_array
  end


  def create_ABCD_rotation(key)
    rotation_array = []
    4.times do |index|
      new = "#{key[index]}#{key[index+1]}".to_i
      rotation_array.push(new)
    end
    return rotation_array
  end

  def add_date_to_rotation(rotation_array, date)
    4.times do |index|
      rotation_array[index] = rotation_array[index] + date[index].to_i
    end
  end
end

