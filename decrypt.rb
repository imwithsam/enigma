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

decrypt = Decrypt.new(ARGV[0], ARGV[1])
decrypt.get_decrypted_message(ARGV[2].to_s, ARGV[3].to_s)
puts decrypt.status
