require './test/test_helper'
require './lib/Decryption_engine'
class DecryptionEngineTest < Minitest::Test
  def setup
    @decryption_engine = DecryptionEngine.new("keder ohulw", "02715",  "040895")
  end

  def test_it_exists
    assert_instance_of DecryptionEngine, @decryption_engine
  end

  def test_it_can_generate_keys
    assert_equal ["12", "23", "34", "45"], @decryption_engine.generate_keys("12345")
  end

  def test_it_can_generate_offset_keys
    assert_equal ["21", "23", "36", "50"], @decryption_engine.offset("012345", ["12", "23", "34", "45"])
  end
end
