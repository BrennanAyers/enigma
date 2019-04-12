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
    offsets = date.to_i.abs2.to_s
    offset_index = -4
    key_array.map do |key|
      key_offset = offsets[offset_index].to_i
      key_int = key.to_i
      offset_index += 1
      (key_int += key_offset).to_s
    end
  end

  def generate_keys(key)
    key_array = []
    key_array << key[0..1]
    key_array << key[1..2]
    key_array << key[2..3]
    key_array << key[3..4]
  end
end
