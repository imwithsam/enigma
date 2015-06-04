require_relative 'crypto'

class Encrypt < Crypto
  # TODO: Ask "Mr. Encrypt, what do you do? What is your key? What is your status?"
  # TODO: Methods should be no more than 8 lines.
  # TODO: Make the Key and Date Generators objects that use class methods.
  def get_encrypted_message
    self.mode = :encrypt
    unencrypted_message = ReaderWriter.read_message(input_file)
    encrypted_message = process_message(unencrypted_message)
    ReaderWriter.write_message(output_file, encrypted_message)
    encrypted_message
  end
end

# encrypt = Encrypt.new("message.txt", "encrypted.txt")
# puts encrypt.get_encrypted_message
# puts encrypt.status
