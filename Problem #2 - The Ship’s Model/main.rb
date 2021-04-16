def rectangle height, width
	base = "|#{"_" * (width - 2)}|"
	line = "|#{" " * (width - 2)}|\n"
	return line*(height-1) + base
end

def triangle height
	out = ""
	height.times do |i|
		out << "#{" " * (height - (i+1))}/#{" " * (2*i)}\\\n"
	end
	return out
end

def rocket triange_height, rectangle_height
	out = triangle(triange_height)
	out << rectangle(rectangle_height, triange_height*2)
	return out
end

tests = gets.chomp.to_i
cases = []
tests.times do
	cases << gets.chomp.split(" ").map{|i| i.to_i}
end
puts cases.map {|c| rocket c[0], c[1]}