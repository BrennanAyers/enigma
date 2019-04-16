class Cracker
  attr_reader :decryption, :key

  def initialize(message, date)
    @message = message
    @date = date
    @alphabet = ("a".."z").to_a << " "
    @key = key_cracker(message, date)
    @decryption = "test" #message_cracker(message, @key, date)
  end


end
