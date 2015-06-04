class KeyGenerator
  # encryption key is 5 random digits padded with zeroes
  def self.get_new_key
    rand(0..99999).to_s.rjust(5, "0")
  end

  def self.get_datestamp
    Time.now.strftime("%d%m%y")
  end

  def self.get_character_map
    [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  # each rotation corresponds to 2 digits in the encryption key
  def self.rotation_a(encryption_key)
    encryption_key[0..1].to_i
  end

  def self.rotation_b(encryption_key)
    encryption_key[1..2].to_i
  end

  def self.rotation_c(encryption_key)
    encryption_key[2..3].to_i
  end

  def self.rotation_d(encryption_key)
    encryption_key[3..4].to_i
  end

  # offsets correspond to each of the last 4 digits of the square of the datestamp
  def self.offset_a(datestamp)
    (datestamp.to_i ** 2).to_s[-4].to_i
  end

  def self.offset_b(datestamp)
    (datestamp.to_i ** 2).to_s[-3].to_i
  end

  def self.offset_c(datestamp)
    (datestamp.to_i ** 2).to_s[-2].to_i
  end

  def self.offset_d(datestamp)
    (datestamp.to_i ** 2).to_s[-1].to_i
  end
end
