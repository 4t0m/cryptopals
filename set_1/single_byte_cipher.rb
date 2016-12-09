require_relative "fixed_xor"
require_relative "hex_to_64"

def decrypt_hex(string)
	possible_strings = generate_possibilities(string)
  best_score = nil	
  plain_text = nil
	
	possible_strings.each do |candidate|
    current_score = score_string(candidate)
    best_score = current_score if best_score.nil?
		if current_score > best_score
			plain_text = candidate
			best_score = current_score
		end
	end

	plain_text
end

def generate_possibilities(hex_string)
	key_bytes = (0..255).map { |i| to_byte(i) }
	source_bytes = hex_string.chars.each_slice(2) { |hex| hex_to_bin(hex) }
	key_bytes.map do |key_candidate|
	  candidate_hex = hex_byte_xor(hex_string, key_candidate)
    hex_to_64(candidate_hex)
	end
end

def hex_byte_xor(hex_string, single_byte)
end

encoded_hex = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
