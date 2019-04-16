require './test/test_helper'
require './lib/enigma'
class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_an_alphabet
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "], @enigma.alphabet
  end

  def test_it_can_encrypt_a_message
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message
    expected = {decryption: "hello world", key: "02715", date: "040895"}

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_will_put_todays_date_if_empty
    fake_date = Date.new(2001, 2, 3)
    Date.stubs(today: fake_date)

    assert_equal "030201", @enigma.encrypt("hello world", "09729")[:date]
  end

  def test_it_can_create_a_random_key_if_empty
    # This srand will create a 4 digit key, which we then prepend a 0 on to
    srand(2231489724)

    assert_equal "09729", @enigma.encrypt("hello world")[:key]
  end

  def test_it_will_downcase_encrypted_messages
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}

    assert_equal expected, @enigma.encrypt("HELLO WORLD", "02715", "040895")
  end

  def test_it_will_downcase_capitalized_messages
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}

    assert_equal expected, @enigma.encrypt("HeLlO wOrLD", "02715", "040895")
  end

  def test_it_will_downcase_decrypted_messages
    expected = {decryption: "hello world", key: "02715", date: "040895"}

    assert_equal expected, @enigma.decrypt("KEDER OHULW", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_bang
    expected = {encryption: "keder ohulw!", key: "02715", date: "040895"}

    assert_equal expected, @enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_a_comma
    expected = {encryption: "keder,sprrdx", key: "02715", date: "040895"}

    assert_equal expected, @enigma.encrypt("hello, world", "02715", "040895")
  end
end
