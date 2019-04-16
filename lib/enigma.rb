class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key = random_key, date = todays_date)
    encrypted = EncryptionEngine.new(message, key, date)
    {
      encryption: encrypted.encryption,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = todays_date)
    decrypted = DecryptionEngine.new(message, key, date)
    {
      decryption: decrypted.decryption,
      key: key,
      date: date
    }
  end

  def random_key
    key = rand(1..99999).to_s
    unless key.length == 5
      key = "0" + key
    end
    key
  end

  def todays_date
    date = Date.today
    date.strftime("%d%m%y")
  end
end
