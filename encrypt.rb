require_relative 'crypto'

class Encrypt < Crypto
  def get_encrypted_message
    self.mode = :encrypt
    unencrypted_message = ReaderWriter.read_message(input_file)
    encrypted_message = process_message(unencrypted_message)
    ReaderWriter.write_message(output_file, encrypted_message)
    encrypted_message
  end
end

encrypt = Encrypt.new(ARGV[0], ARGV[1])
encrypt.get_encrypted_message
puts encrypt.status
