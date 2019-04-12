require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption_engine'
class EncryptionEngineTest < Minitest::Test
  def setup
    @encryption_engine = EncryptionEngine.new("hello world", "02715",  "040895")
  end

  def test_it_exists
    assert_instance_of EncryptionEngine, @encryption_engine
  end

  def test_it_can_generate_keys
    assert_equal ["12", "23", "34", "45"], @encryption_engine.generate_keys("12345")
  end
end
