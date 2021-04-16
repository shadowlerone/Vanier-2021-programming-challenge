def entire_division a, b
	count = 0
	tempnum = a
	until b > tempnum
		tempnum -= b
		count += 1
	end
	out = "#{count}"
	out << " remainder #{tempnum}" if tempnum != 0
	return out
end

tests = gets.chomp.to_i
cases = []
tests.times do
	cases << gets.chomp.split(" ").map{|i| i.to_i}
end
# cases.map {|c| entire_division c[0], c[1]}
puts cases.map {|c| entire_division c[0], c[1]}