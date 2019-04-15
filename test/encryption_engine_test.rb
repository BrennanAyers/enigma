require './test/test_helper'
require './lib/encryption_engine'
class EncryptionEngineTest < Minitest::Test
  def setup
    @encryption_engine = EncryptionEngine.new("hello world", "02715",  "040895")
  end

  def test_it_exists
    assert_instance_of EncryptionEngine, @encryption_engine
  end

end
