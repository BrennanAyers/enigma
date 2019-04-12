class EncryptionEngine
  attr_reader :encryption, :key, :date

  def initialize(message, key, date)
    # @encryption = encrypt(message)
    @key = key
    @date = date
    # @offset = offset(date)
  end

  # def encrypt(message)
  #   generate_keys(key)
  #
  # end

  def offset(date, key_array)

  end

  def generate_keys(key)
    key_array = []
    key_array << key[0..1]
    key_array << key[1..2]
    key_array << key[2..3]
    key_array << key[3..4]
  end
end
