require 'json';

abc = JSON.parse(File.read(ARGV[0]))
output = JSON.parse(File.read(ARGV[1]))

a = abc['a'].to_f
b = abc['b'].to_f
c = abc['c'].to_f

def roundNumberIfNeeded(number)
	if(number % 1 == 0)
		number = number.to_i
	else
		number = (number).round(2)
	end

	return number
end

squares = []
if (a == 0)
	if (b == 0 && c == 0)
		puts "#"
	else
		squares[0] = -(c / a)
		squares[0] = roundNumberIfNeeded(squares[0])
	end
else
	flag = false

	discriminant = (b**2) - (4 * a * c)
	
	if (discriminant > 0)
		squares[0] = (-b + Math.sqrt(discriminant)) / (2 * a)
		squares[1] = (-b - Math.sqrt(discriminant)) / (2 * a)
	elsif (discriminant == 0)
		squares[0] = -b / (2 * a)
	else
		puts "discriminant is negative"
	end

	for i in 0..squares.length - 1
		squares[i] = roundNumberIfNeeded(squares[i])
	end

	if(discriminant >= 0)
		output['x1'] = squares[0]
		output['x2'] = squares[1]
		output['D'] = discriminant
		puts JSON.pretty_generate output
	end
end
