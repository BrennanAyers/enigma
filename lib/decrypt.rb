require './lib/enigma'
message_file, decrypted_file, key, date = ARGV

message = File.read("./lib/#{message_file}")

enigma = Enigma.new

decrypted = enigma.decrypt(message, key, date)

new_file = File.open("./lib/#{decrypted_file}", "w")
new_file.write(decrypted[:decryption])
new_file.close

puts "Created '#{decrypted_file}' with the key #{decrypted[:key]} and date #{decrypted[:date]}"
