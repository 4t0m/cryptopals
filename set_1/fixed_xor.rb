require_relative 'hex_to_64'

def fixed_xor(string_1, string_2)
  bin_1, bin_2 = hex_to_bin(string_1), hex_to_bin(string_2)
  p bin_1
  p bin_2
  bin_xor =  (0...bin_1.length).inject("") do |result, index|
    result + (bin_1[index] == bin_2[index] ? '0' : '1')
  end
  p bin_xor 
  bin_xor.to_i(16)
end

# test code
string_1 = '1c0111001f010100061a024b53535009181c'
string_2 = '686974207468652062756c6c277320657965'

puts fixed_xor(string_1, string_2) == '746865206b696420646f6e277420706c6179'
