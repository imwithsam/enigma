require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../crypto'

class CryptoTest < MiniTest::Test
  def test_initialize
    input_file = "input_test.txt"
    output_file = "output_test.txt"
    crypto = Crypto.new(input_file, output_file)

    assert_equal input_file, crypto.input_file
    assert_equal output_file, crypto.output_file
    # assert File.exist?("input_text.txt"), "input_test.txt does NOT exist!"
    # assert File.exist?("output_test.txt"), "output_test.txt does NOT exist!"
  end

  def test_process_message
    input_file = "input_test.txt"
    output_file = "output_test.txt"
    message = "test message."
    crypto = Crypto.new(input_file, output_file)

    output = crypto.process_message(message)
    assert output =~ (/[a-z0-9 .,]/), "Output message is invalid."
  end

  def test_status
    input_file = "input_test.txt"
    output_file = "output_test.txt"
    message = "test message."
    crypto = Crypto.new(input_file, output_file)
    crypto.process_message(message)

    assert crypto.status.start_with?("Created '#{output_file}' with the key "), "Status message is invalid."
    assert crypto.status.end_with?(" and date #{Time.now.strftime("%d%m%y")}"), "Status message is invalid."
  end
end
