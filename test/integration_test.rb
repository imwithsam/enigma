require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../encrypt'
require_relative '../decrypt'

class IntegrationTest < MiniTest::Test
  def test_generates_5_digit_encryption_key
    skip
    encrypt = Encrypt.new("message.txt", "encrypted.txt")
    encryption_key = encrypt.get_key
    assert encryption_key.length, 5
  end

  def test_generates_datestamp_with_current_date_in_DDMMYY_format
    skip
    encrypt = Encrypt.new("message.txt", "encrypted.txt")
    datestamp = encrypt.get_datestamp
    assert_equal Time.now.strftime("%d%m%y"), datestamp
  end

  def test_generates_correct_status_message
    skip
    output_file = "encrypted.txt"
    encrypt = Encrypt.new("message.txt", output_file)
    status = encrypt.status
    assert_equal "Created '#{output_file}' with the key #{status[:encryption_key]} and date #{Time.now.strftime('%d%m%y')}", status[:message]
  end

  def test_correctly_encrypts_given_key_and_datestamp
    skip
  end
end