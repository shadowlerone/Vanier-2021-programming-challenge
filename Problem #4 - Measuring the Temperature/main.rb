def f_to_c (temp)
	5 * (temp - 32) / 9
end
def c_to_k (temp)
	temp + 273.15
end
def format_int (temp)
	"%.1f" % temp
end
def calc temp
	format_int c_to_k f_to_c temp
end
tests = gets.chomp.to_i
cases = []
tests.times do
	cases << gets.chomp.to_f
end
puts cases.map{|c| calc c}