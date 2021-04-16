$letters_to_numbers = {
	"A" => 1,
	"B" => 2,
	"C" => 3,
	"D" => 4,
	"E" => 5,
	"F" => 6,
	"G" => 7,
	"H" => 8,
	"I" => 9,
	"J" => 10,
	"K" => 11,
	"L" => 12,
	"M" => 13,
	"N" => 14,
	"O" => 15,
	"P" => 16,
	"Q" => 17,
	"R" => 18,
	"S" => 19,
	"T" => 20,
	"U" => 21,
	"V" => 22,
	"W" => 23,
	"X" => 24,
	"Y" => 25,
	"Z" => 26
}
$numbers_to_letters = $letters_to_numbers.invert
def date_checker date
	out = date.chars.filter{|c| c != "/"}.map do |c|
		if c.to_i.even?
			c.to_i + 1
		else 
			c.to_i
		end
	end
	return out
end
def encoder message, date1, date2
	dsend = date_checker date1
	dreceive = date2.chars.filter{|c| c != "/"}.map{|c|c.to_i}
	count = 0
	encoded = message.chars.map.with_index do |c, index|
		unless [" ", ".", ","].include? c
			code_modded = (dsend[(count%8)] * $letters_to_numbers[c.upcase] + dreceive[(count%8)]) % 26
			code_modded = 26 if code_modded < 1
			count += 1
			if c == c.upcase
				l = $numbers_to_letters[code_modded].upcase
			else
				l = $numbers_to_letters[code_modded].downcase
			end
			l
		else
			c
		end
	end
	return encoded.join()
end
date1, date2 = gets.chomp.split(" ")
message = gets.chomp
puts encoder message, date1, date2