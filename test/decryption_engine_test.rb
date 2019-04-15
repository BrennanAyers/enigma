require './test/test_helper'
require './lib/decryption_engine'
class DecryptionEngineTest < Minitest::Test
  def setup
    @decryption_engine = DecryptionEngine.new("keder ohulw", "02715",  "040895")
  end

  def test_it_exists
    assert_instance_of DecryptionEngine, @decryption_engine
  end

end
