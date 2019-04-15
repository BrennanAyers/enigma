class EncryptionEngine
  attr_reader :encryption, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
    @encryption = encrypt(message)
  end

  def offset_keys
    offset_index = -4
    generate_keys(key).map do |key|
      key_offset = generate_offsets(@date)[offset_index].to_i
      key_int = key.to_i
      offset_index += 1
      key_int += key_offset
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
    @alphabet.rotate(offset_key.to_i % 27)
  end

  def encrypt(message)
    # offset_keys = offset(date, generate_keys(key))
    encrypted_message = ""
    @message.split("").each_with_index do |char, index|
      alphabet = rotated_alphabet(offset_keys[index % 4])
      alpha_index = @alphabet.find_index(char)
      encrypted_message += alphabet[alpha_index]
    end
    encrypted_message
  end

end
