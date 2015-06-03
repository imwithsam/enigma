class Encrypt
  # TODO: Ask "Mr. Encrypt, what do you do? What is your key? What is your status?"
  # TODO: Methods should be no more than 8 lines.
  # TODO: Make the Key and Date Generators objects that use class methods.
  # first command line argument = message.txt
  # second command line argument = encrypted.txt
  # returns "Created 'encrypted.txt' with the key 82648 and date 030415"

  def initialize(input_file = ARGV[0], output_file = ARGV[1])
    @input_file = input_file
    @output_file = output_file
    @encryption_key = self.get_key
    @datestamp = self.get_datestamp
  end

  def status
    {
        output_file: @output_file,
        encryption_key: @encryption_key,
        datestamp: @datestamp,
        message: "Created '#{@output_file}' with the key #{@encryption_key} and date #{@datestamp}"
    }
  end

  def get_key
    # random 5-digits padded with zeroes
    rand(0..99999).to_s.rjust(5, "0")
  end

  def get_datestamp
    Time.now.strftime("%d%m%y")
  end

  def get_character_map
    [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  # Encrypt
  # rotations correspond to pairs of digits in the encryption key
  def rotation_a
    @encryption_key[0..1]
  end

  def rotation_b
    @encryption_key[1..2]
  end

  def rotation_c
    @encryption_key[2..3]
  end

  def rotation_d
    @encryption_key[3..4]
  end

  # offsets correspond to each of the last 4 digits of the square of the datestamp
  def offset_a
    (@datestamp.to_i ** 2).to_s[-4].to_i
  end

  def offset_b
    (@datestamp.to_i ** 2).to_s[-3].to_i
  end

  def offset_c
    (@datestamp.to_i ** 2).to_s[-2].to_i
  end

  def offset_d
    (@datestamp.to_i ** 2).to_s[-1].to_i
  end

  # Algorithm: [(index of unencrypted character + rotation + offset) % character map length] => character map index for encrypted character

  # Output File
  # output encrypted file to output_file
end
