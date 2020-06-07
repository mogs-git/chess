class Board
	attr_accessor :squares

	def initialize 
		@squares = Array.new(8) { Array.new(8, " ") }
	end

	def display_board
		puts
		print " "
		puts "-" * 33
		8.times do |x|
			print " |"
			8.times do |y|
				print " #{squares[x][y]} |"
			end
			puts 
			print " "
			puts "-" * 33
		end
		puts
	end
end

b = Board.new

b.display_board