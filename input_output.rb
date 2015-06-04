class FileManipulation

  def reader(input)
    file = File.open(input, "r")
   message = ""
    while (line = file.gets)
      message += line
    end
    file.close

    return message

  end

  def writer(input, file)
    file = File.open(file, "w")
    file << input
  end

end


