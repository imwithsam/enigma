class ReaderWriter
  def self.read_message(filename)
    reader = File.open(filename, "r")
    message = reader.read
    reader.close
    message
  end

  def self.write_message(filename, message)
    writer = File.open(filename, "w")
    writer.write(message)
    writer.close
    message
  end
end
