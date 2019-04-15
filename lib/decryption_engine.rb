class DecryptionEngine
  attr_reader :decryption, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
    @decryption = decrypt(message)
  end

  def offset_keys
    generate_keys(key).map.with_index do |key, index|
      key_offset = generate_offsets(@date)[index]
      key += key_offset
    end
  end

  def generate_offsets(date)
    offsets = date.to_i.abs2.to_s
    last_4 = offsets.split("").last(4)
    last_4.map(&:to_i)
  end

  def generate_keys(key)
    key_array = []
    key_array << key[0..1].to_i
    key_array << key[1..2].to_i
    key_array << key[2..3].to_i
    key_array << key[3..4].to_i
  end

  private

  def rotated_alphabet(offset_key)
    @alphabet.rotate(-(offset_key.to_i % 27))
  end

  def decrypt(message)
    @message.split("").map.with_index do |char, index|
      alphabet = rotated_alphabet(offset_keys[index % 4])
      alpha_index = @alphabet.find_index(char)
      alphabet[alpha_index]
    end.join
  end

end
