def simulate (inputs)
	switches = [false, false, false]
	inputs.map{|i| i[1].to_i - 1}.each{|i| switches[i] = !switches[i]}
	return switches.map{|s| s.to_s.capitalize}.join(" ")
end
tests = gets.chomp.to_i
cases = []
tests.times do
	cases << gets.chomp.split(" ")
end
puts cases.map{|c| simulate c}