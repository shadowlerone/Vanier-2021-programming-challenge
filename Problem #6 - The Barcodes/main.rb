def to_barcode code
	"\##{code.to_s(2).gsub("1", "|").gsub("0"," ")}\#"
end
tests = gets.chomp.to_i
cases = []
tests.times do
	cases << gets.chomp.to_i
end
puts cases.map{|c| to_barcode c}