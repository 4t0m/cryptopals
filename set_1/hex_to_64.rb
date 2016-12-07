require 'base64'

b64_values = (0..63).to_a
b64_strings = ('A'..'Z').to_a +
              ('a'..'z').to_a +
              (0..9).to_a.map(&:to_s) +
              ['+', '/']

BASE64_ENCODE_HASH = {}

(0...64).each do |index|
  BASE64_ENCODE_HASH[b64_values[index]] = b64_strings[index]
end

BASE64_ENCODE_HASH.freeze

def hex_to_64(hex_string)
  bin = hex_to_bin(hex_string)
  p bin_to_64(bin)
end

def hex_to_bin(hex_string)
  hex_string.chars.map do |x|
    bin_str = x.hex.to_s(2)
    bin_str = "0#{bin_str}" until bin_str.length == 4
    bin_str
  end.join
end

def bin_to_64(bin_string)
  bin = bin_string.dup
  bin << "0" until bin.length % 6 == 0
  bin.chars.each_slice(6).map do |bin_vals|
    six_bit = bin_vals.join
    int_val = six_bit.to_i(2)
    BASE64_ENCODE_HASH[int_val]
  end.join
end

# TEST CODE
test_hex = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'
target_64 = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'

puts hex_to_64(test_hex) == target_64
