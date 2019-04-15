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
    assert_equal [12, 23, 34, 45], @decryption_engine.generate_keys("12345")
  end

  def test_it_can_generate_offsets
    assert_equal [9, 0, 2, 5], @decryption_engine.generate_offsets("012345")
  end

  def test_it_can_generate_offset_keys
    assert_equal [3, 27, 73, 20], @decryption_engine.offset_keys
  end
end
