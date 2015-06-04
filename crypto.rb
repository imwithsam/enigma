require_relative 'key_generator'
require_relative 'reader_writer'

class Crypto
  attr_accessor :mode,
                :input_file,
                :output_file,
                :encryption_key,
                :datestamp

  def initialize(input_file = ARGV[0], output_file = ARGV[1])
    self.input_file = input_file
    self.output_file = output_file
    self.encryption_key = KeyGenerator.get_new_key
    self.datestamp = KeyGenerator.get_datestamp
  end

  def process_message(input)
    character_map = KeyGenerator.get_character_map
    char_counter = 1
    output_chars = []
    output_message = ""

    input.each_char do |input_char|
      case char_counter
        when 1
          rotation = KeyGenerator.rotation_a(encryption_key)
          offset = KeyGenerator.offset_a(datestamp)
        when 2
          rotation = KeyGenerator.rotation_b(encryption_key)
          offset = KeyGenerator.offset_b(datestamp)
        when 3
          rotation = KeyGenerator.rotation_c(encryption_key)
          offset = KeyGenerator.offset_c(datestamp)
        else
          rotation = KeyGenerator.rotation_d(encryption_key)
          offset = KeyGenerator.offset_d(datestamp)
      end

      # encrypt moves to the right on the character map (add)
      # decrypt moves to the left on the character map (subtract)
      if mode == :decrypt
        rotation = -rotation
        offset = -offset
      end

      input_index = character_map.index do |map_char|
        map_char == input_char
      end

      # Algorithm:
      #   [(index of unencrypted character + rotation + offset) % character map length]
      #     => character map index for encrypted character
      output_index = (input_index + rotation + offset) % character_map.length
      output_chars << character_map[output_index]
      output_message = output_chars.join

      if char_counter < 4
        char_counter += 1
      else
        char_counter = 1
      end
    end

    output_message
  end

  def status
    if mode == :decrypt
      status = "Decrypted '#{input_file}' to '#{output_file}' with the key #{encryption_key} and date #{datestamp}"
    else
      status = "Created '#{output_file}' with the key #{encryption_key} and date #{datestamp}"
    end
  end
end
