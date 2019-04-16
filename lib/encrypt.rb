require './lib/enigma'
message_file, encrypted_file = ARGV

message = File.read("./lib/#{message_file}")

enigma = Enigma.new

encrypted = enigma.encrypt(message)

require "pry"; binding.pry
