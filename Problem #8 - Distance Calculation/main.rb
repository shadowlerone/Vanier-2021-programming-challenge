# require "math"
UA = 150000000
AL = 9461000000000

class Coordinate
	attr_reader :x, :y, :z
	def initialize unit, x, y, z
		@unit = unit
		@x = x.to_f
		@y = y.to_f
		@z = z.to_f
	end
	def -(coord)
		return Distance.new Math.sqrt((@x - coord.x)** 2 + (@y - coord.y)**2 + (@z - coord.z)**2), @unit
	end
end
class Distance
	attr_reader :unit, :val
	def initialize val, unit
		@val = val
		@unit = unit
	end
	def to_UA
		if @unit != "UA"
			if @unit == "AL"
				return  @val * 63073
			elsif @unit == "km"	
				return @val / UA
			end
		else 
			return @val
		end
	end
	def to_AL
		if @unit != "AL"
			if @unit == "UA"
				return  @val / 63073
			elsif @unit == "km"	
				return @val / AL
			end
		else 
			return @val
		end
	end
	def to_km
		if @unit != "km"
			if @unit == "UA"
				return  @val * UA
			elsif @unit == "AL"	
				return @val * AL
			end
		else 
			return @val
		end
	end
	def pretty_print
		case @unit
		when "UA"
			r1 = 0.1
			r2 = Distance.new(0.1, "AL").to_UA
		when "AL"
			r1 = Distance.new(0.1, "UA").to_AL
			r2 = 0.1
		else
			r1 = Distance.new(0.1, "UA").to_km
			r2 = Distance.new(0.1, "AL").to_km
		end

		case @val
		when 0...r1
			return "%0.3f km" % self.to_km
		when r1...r2
			return "%0.3f UA" % (self.to_UA)
		else
			return "%0.3f AL" % (self.to_AL)
		end
	end
end
def parse_input str
	return /(km|UA|AL) \(([0-9\-.]+) ([0-9\-.]+) ([0-9\-.]+)\) \(([0-9\-.]+) ([0-9\-.]+) ([0-9\-.]+)\)/.match(str).captures
end
def main c
	coord1 = Coordinate.new(c[0], c[1], c[2], c[3])
	coord2 = Coordinate.new(c[0], c[4], c[5], c[6])
	distance = coord2 - coord1
	return distance.pretty_print
end
tests = gets.chomp.to_i
cases = []
tests.times do
	cases << parse_input(gets.chomp)
end
puts cases.map{|c| main c}