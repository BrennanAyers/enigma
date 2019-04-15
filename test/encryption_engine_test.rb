require './test/test_helper'
require './lib/encryption_engine'
class EncryptionEngineTest < Minitest::Test
  def setup
    @encryption_engine = EncryptionEngine.new("hello world", "02715",  "040895")
  end

  def test_it_exists
    assert_instance_of EncryptionEngine, @encryption_engine
  end

  def test_it_can_generate_keys
    assert_equal [12, 23, 34, 45], @encryption_engine.generate_keys("12345")
  end

  def test_it_can_generate_offsets
    assert_equal [9, 0, 2, 5], @encryption_engine.generate_offsets("012345")
  end

  def test_it_can_generate_offset_keys
    assert_equal [3, 27, 73, 20], @encryption_engine.offset_keys
  end
end
