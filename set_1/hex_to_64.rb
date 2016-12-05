HEX_DECODE_HASH = { '0' => 0,
                    '1' => 1,
                    '2' => 2,
                    '3' => 3,
                    '4' => 4,
                    '5' => 5,
                    '6' => 6,
                    '7' => 7,
                    '8' => 8,
                    '9' => 9,
                    'a' => 10,
                    'b' => 11,
                    'c' => 12,
                    'd' => 13,
                    'e' => 14,
                    'f' => 15 }.freeze

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
  binary_vals = decode_hex(hex_string)
  new_binary = resegment_binary(binary_vals)
  encode_64(new_binary)
end

def decode_hex(hex_string)
  characters = hex_string.chars
  vals = characters.map { |char| HEX_DECODE_HASH[char] }
  vals.map { |val| hex_to_binary(val) }
end

def hex_to_binary(val)
  base = 2
  power = 3
  binary_string = ""

  until power < 0
    if val >= base**power
      binary_string << '1'
      val -= base**power
    else
      binary_string << '0'
    end

    power -= 1
  end

  binary_string
end

def resegment_binary(binary_array)

end

def encode_64(raw_vals)
  characters = raw_vals.map { |val| BASE64_ENCODE_HASH[val] }
  characters.join
end


# TEST CODE
test_hex = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'
target_64 = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'

puts hex_to_64(test_hex) == target_64
