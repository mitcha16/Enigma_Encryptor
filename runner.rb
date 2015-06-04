#$ ruby ./lib/encrypt.rb message.txt encrypted.txt
#Created 'encrypted.txt' with the key 82648 and date 030415
require_relative 'offset'
require_relative 'input_output'
require_relative 'offset'
require_relative 'encrypt.rb'
class Runner

  def run
    file_stuff = FileManipulation.new
    puts "\n\nWould you like to enter in a 5 character key? If so, enter your key. If not, we will generate a random key for you.\n\n"
    input = gets.chomp
    key = OffsetCalculator.new.input_key(input)
    if input == ""
      input = key
    end
    read =get_message
    write =get_file
    output(read, write, input)
    message = file_stuff.reader(read)
    solution = encrypt_or_decrypt(message, key)
    file_stuff.writer(solution, write)
  end


  def get_time(time = Time.new)
    return time.strftime("%d%m%y")
  end


  def output(read, write, input)
    puts "\n\n$ ruby ./lib/encrypt.rb #{read} #{write}
          Created '#{write}' with the key #{input} and date #{get_time}\n\n"
  end


  def get_message
    puts "\n\nWhat is the name of the file you would like to use?\n\n"
    return gets.chomp
  end


  def get_file
    puts "\n\nWhat is the name of the file you would like to write to?\n\n"
    return gets.chomp
  end

  def encrypt_or_decrypt(message, key)
    encryptor = Encrypt.new
    answer = ask_for_action
    if answer == "decrypt"

      return encryptor.rotate_back(message, key)

    else
      return encryptor.rotate(message, key)
    end


  end

  def ask_for_action
    answer = ""
    while answer != "decrypt" && answer != "encrypt"
      puts "\n\nWould you like to encrypt or decrypt your file?\n\n"
      answer = gets.chomp
    end
    return answer
  end

end

Runner.new.run