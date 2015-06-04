require_relative 'crypto'

class Crack < Crypto
  def get_decrypted_message(datestamp)
    self.mode = :decrypt
    self.datestamp = datestamp

    known_signoff = "..end.."
    encrypted_message = ReaderWriter.read_message(input_file)

    # get_new_key
    (0..99999).each do |key|
      self.encryption_key = key.to_s.rjust(5, "0")
      decrypted_message = process_message(encrypted_message)
      if decrypted_message[(-known_signoff.length)..-1] == known_signoff
        ReaderWriter.write_message(output_file, decrypted_message)
        return decrypted_message
      end
    end

    "Unable to crack message. It's an enigma!"
  end
end

crack = Crack.new(ARGV[0], ARGV[1])
crack.get_decrypted_message(ARGV[2].to_s)
puts crack.status
