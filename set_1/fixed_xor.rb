require_relative 'hex_to_64'

def fixed_xor(string_1, string_2)
  bin_1, bin_2 = hex_to_bin(string_1), hex_to_bin(string_2)
  bin_str = bin_xor(bin_1, bin_2)
  bin_to_hex(bin_str)
end

def bin_xor(bin_1, bin_2)
  result = ""
  (0...bin_1.length).each do |index|
    result += (bin_1[index] == bin_2[index] ? "0" : "1")
  end
  
  result 
end

def bin_to_hex(bin_str)
  hex_str = ""
  bin_str.chars.each_slice(4) do |nibble|
    hex_str << nibble.join.to_i(2).to_s(16)
  end

  hex_str
end 
    

# test code
string_1 = '1c0111001f010100061a024b53535009181c'
string_2 = '686974207468652062756c6c277320657965'

puts fixed_xor(string_1, string_2) == '746865206b696420646f6e277420706c6179'
