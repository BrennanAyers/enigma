require './test/test_helper'
require './lib/cracker'
class CrackerTest < Minitest::Test
  def setup
    @cracker = Cracker.new("jibaqdmdtpupgru", "030201")
    @key = "02715"
  end

  def test_it_exists
    assert_instance_of Cracker, @cracker
  end

  def test_it_can_crack_a_key
    assert_equal @key, @cracker.key
  end
end
