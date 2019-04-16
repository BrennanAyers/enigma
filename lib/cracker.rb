class Cracker
  attr_reader :decryption, :key

  def initialize(message, date)
    @message = message
    @date = date
    @alphabet = ("a".."z").to_a << " "
    @key = key_cracker(message, date)
    @decryption = "test" #message_cracker(message, @key, date)
  end

  def generate_offsets(date)
    offsets = date.to_i.abs2.to_s
    last_4 = offsets.split("").last(4)
    last_4.map(&:to_i)
  end
  
  def key_cracker(message, date)
    offsets = generate_offsets(date)

  end
end
