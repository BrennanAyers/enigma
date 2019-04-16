require './lib/enigma'
message_file, encrypted_file = ARGV

message = File.read(message_file)

enigma = Enigma.new

enrypted = enigma.encrypt(message)
