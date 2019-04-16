require './lib/enigma'
message_file, encrypted_file = ARGV

message = File.read("./lib/#{message_file}")

enigma = Enigma.new

encrypted = enigma.encrypt(message)

new_file = File.open("./lib/#{encrypted_file}", "w")
new_file.write(encrypted[:encryption])
