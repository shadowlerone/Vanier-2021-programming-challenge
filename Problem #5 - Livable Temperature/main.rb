def tempCheck temps
	print temps
	puts
	average = temps.sum/temps.size
	minimum, maximum = temps.minmax
	if (maximum-minimum < 60 && 10 <= average && average <= 30)
		return "%.1f" % average
	else
		return "danger"
	end
end


tests = gets.chomp.to_i
cases = []
tests.times do
	cases << gets.chomp.split(" ").map{|c| c.to_f}
end
puts cases.map{|c| tempCheck c}