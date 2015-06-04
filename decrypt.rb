require_relative 'crypto'

class Decrypt < Crypto
  def get_decrypted_message(encryption_key, datestamp)
    self.mode = :decrypt
    self.encryption_key = encryption_key
    self.datestamp = datestamp

    encrypted_message = ReaderWriter.read_message(input_file)
    decrypted_message = process_message(encrypted_message)
    ReaderWriter.write_message(output_file, decrypted_message)
    decrypted_message
  end
end

# decrypt = Decrypt.new("encrypted.txt", "decrypted.txt")
# puts decrypt.get_decrypted_message("69074", "030615")
# puts decrypt.status
