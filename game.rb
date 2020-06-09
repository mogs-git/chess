class Board
	attr_accessor :squares, :pieces
	attr_reader :alphabet

	def initialize 
		@squares = Array.new(8) { |i| Array.new(8) { |j| Square.new([i,j]) } }
		@alphabet = ("a".."z").to_a
		@pieces = setup_pieces
	end

	def display_board
		puts
		print " "
		puts "-" * 33
		8.times do |x|
			print " |"
			8.times do |y|
				print " #{squares[x][y].piece.symbol} |"
			end
			puts 
			print " "
			puts "-" * 33
		end
		puts
	end

	def compute_start_position (piece, colour, letter)
		if colour == "black"
			piece == "pawn" ? row = 1 : row = 0
		else
			piece == "pawn" ? row = 6 : row = 7
		end

		case piece
		when "pawn"
			col = alphabet.index(letter)
		when "rook"
			letter == "a" ? col = 0 : col = 7
		when "knight"
			letter == "a" ? col = 1 : col = 6
		when "bishop"
			letter == "a" ? col = 2 : col = 5
		when "queen"
			col = 3
		when "king"
			col = 4
		else 
			col = nil
		end

		return [row, col]
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

		colours.each do |colour|
			tally.each do |piece, n|
				n.times do |i|
					letter = self.alphabet[i]
					identifier = [colour, piece, letter].join("_")
					pieces.push(Piece.new(identifier, piece_symbol[piece][colour], piece, colour, letter))
				end
			end
		end
		pieces.each {|piece| puts piece.name}
		pieces
	end

	def setup_board
		pieces.each do |piece|
			puts piece
			start_position = compute_start_position(piece.type, piece.colour, piece.letter)
			squares[start_position[0]][start_position[1]].piece = piece
		end
	end
end

class Square
	attr_accessor :position, :piece

	def initialize (position)
		@position = position
		@piece = Piece.new(nil, " ", nil, nil, nil)
	end
end

class Piece
	attr_accessor :name, :symbol, :type, :colour, :letter

	def initialize (name, symbol, type, colour, letter)
		@name = name
		@symbol = symbol
		@type = type
		@colour = colour
		@letter = letter
	end
end

b = Board.new

# b.display_board
# b.pieces
b.setup_board
b.display_board