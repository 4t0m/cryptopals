def hex_to_64(hex_string)
  bin = hex_to_bin(hex_string)
  bin_to_64(bin)
end

def hex_to_bin(hex_string)
  hex_string.chars.map do |hex|
    int_val = HEX_DECODE_HASH[hex]
    int_to_binary(int_val, padding = 4) 
  end.join
end

def int_to_binary(integer, padding = nil)
	base = 2
	power = 0
	if padding
		power = padding - 1
	else
	  power += 1 until base**power >= integer
		power -= 1 if integer.odd?
	end
  binary_str = ""

	until power < 0
		if integer >= base**power
			binary_str << '1'
			integer -= base**power
		else
			binary_str << '0'
		end

		power -= 1
	end

	binary_str
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

private

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

hex_vals = HEX_DECODE_HASH.values
hex_keys = HEX_DECODE_HASH.keys

HEX_ENCODE_HASH = {}

(0...hex_vals.length).each do |index|
  HEX_ENCODE_HASH[hex_vals[index]] = hex_keys[index]
end

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


# TEST CODE
test_hex = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'
target_64 = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'

puts hex_to_64(test_hex) == target_64
