require './lib/engine_module'
class EncryptionEngine
  include EngineModule
  attr_reader :encryption, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
    @encryption = send(message)
  end

  private

  def rotated_alphabet(offset_key)
    @alphabet.rotate(offset_key.to_i % 27)
  end
end
