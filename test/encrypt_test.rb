require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../encrypt'

class EncryptTest < MiniTest::Test
  def test_get_encrypted_message
    `echo ruby encrypt.rb input_test.txt output_test.txt\n`

    assert File.exist?(input_file), "#{input_file} does NOT exist!"
    assert File.exist?(output_file), "#{output_file} does NOT exist!"
    assert output =~ (/[a-z0-9 .,]/), "Output message is invalid."
  end
end
