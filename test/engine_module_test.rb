require './test/test_helper'
require 'mocha/minitest'
require './lib/engine_module'

class DummyEngine
  include EngineModule
  attr_reader :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
  end
end

class EngineModuleTest < Minitest::Test
  def setup
    @engine = DummyEngine.new("hello world", "02715",  "040895")
  end

  def test_it_can_generate_keys
    assert_equal [12, 23, 34, 45], @engine.generate_keys("12345")
  end

  def test_it_can_generate_offsets
    assert_equal [9, 0, 2, 5], @engine.generate_offsets("012345")
  end

  def test_it_can_generate_offset_keys
    assert_equal [3, 27, 73, 20], @engine.offset_keys
  end

end
