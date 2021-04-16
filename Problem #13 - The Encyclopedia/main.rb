class Material
	attr_reader :name, :volume, :mass, :color, :density
	def initialize name, volume, mass, color
		@name = name
		@volume = volume.to_f
		@mass = mass.to_f
		@color = color
		@density = @mass/@volume
	end
	def to_s
		@name
	end
end
class Sample
	attr_reader :volume, :mass, :color, :density
	def initialize colors, volume, mass
		@colors = colors.split("/")
		@volume = volume.to_f
		@mass = mass.to_f
		@density = @mass/@volume
		@main_component = (
			@density - $data[@colors[1]].density
		)/($data[@colors[0]].density-$data[@colors[1]].density)
	end
	def to_s
		if (@main_component > 1- @main_component)
			"#{self.component1_percentage}\% #{$data[@colors[0]]} and #{self.component2_percentage}\% #{$data[@colors[1]]}"
		else
			"#{self.component2_percentage}\% #{$data[@colors[1]]} and #{self.component1_percentage}\% #{$data[@colors[2]]}"
		end
	end
	def component1_percentage
		"%.2f" % (@main_component*100)
	end
	def component2_percentage
		"%.2f" % (100-@main_component*100)
	end
end
def main c
	s = Sample.new(c[0], c[1], c[2])
	return s.to_s
end

$data = {}
data_count = gets.chomp.to_i
data_count.times do
	d = gets.chomp.split(" - ")
	$data[d[3]] = Material.new d[0], d[1], d[2], d[3]
end
tests = gets.chomp.to_i
cases = []
tests.times do
	cases << gets.chomp.split(" - ")
end
puts cases.map{|c| main c}