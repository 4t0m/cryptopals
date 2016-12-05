require 'base64'

def hex_to_64(hex_string)
  bin = hex_to_bin(hex_string)
  #Base64.strict_encode64(bin)
  bin.unpack('m')
end

def hex_to_bin(hex_string)
  hex_string.scan(/../).map { |x| x.hex.to_s(2) }.join
end


# TEST CODE
test_hex = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'
target_64 = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'

p hex_to_64(test_hex)

puts hex_to_64(test_hex) == target_64
