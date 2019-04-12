class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    encrypted = EncryptionEngine.new(message, key, date)
    {
      encryption: encrypted.encryption,
      key: key,
      date: date
    }
  end
end
