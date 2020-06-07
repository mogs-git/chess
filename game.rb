class Board
	attr_accessor :squares, :pieces

	def initialize 
		@squares = Array.new(8) { |i| Array.new(8) { |j| Square.new([i,j]) } }
		@pieces = setup_pieces
	end

	def display_board
		puts
		print " "
		puts "-" * 33
		8.times do |x|
			print " |"
			8.times do |y|
				print " #{squares[x][y].piece} |"
			end
			puts 
			print " "
			puts "-" * 33
		end
		puts
	end

	def setup_pieces
		tally = {
			"queen" => 1, 
			"king" => 1,
			"bishop" => 2, 
			"knight" => 2,
			"rook" => 2, 
			"pawn" => 8,
		}

		piece_symbol = {
			"queen" => {"white" => "\u2655", "black" => "\u265B"},
			"king" => {"white" => "\u2654", "black" => "\u265A"},
			"bishop" => {"white" => "\u2657", "black" => "\u265D"},
			"knight" => {"white" => "\u2658", "black" => "\u265E"},
			"rook" => {"white" => "\u2656", "black" => "\u265C"},
			"pawn" => {"white" => "\u2659", "black" => "\u265F"}
		}

		colours = ["white", "black"]

		pieces = []

		alphabet = ("a".."z").to_a

		colours.each do |colour|
			tally.each do |piece, n|
				n.times do |i|
					puts i
					identifier = [colour, piece, alphabet[i]].join("_")
					pieces.push(Piece.new(identifier, piece_symbol[piece][colour]))
				end
			end
		end
		pieces.each {|piece| puts piece.name}
		pieces
	end
end

class Square
	attr_accessor :position, :piece

	def initialize (position)
		@position = position
		@piece = " "
	end
end

class Piece
	attr_accessor :name, :symbol

	def initialize (name, symbol)
		@name = name
		@symbol = symbol
	end
end

b = Board.new

b.display_board
b.pieces