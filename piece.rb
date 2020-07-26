class Piece
	attr_accessor :name, :symbol, :type, :colour, :letter

	def initialize (name, symbol, type, colour, letter)
		@name = name
		@symbol = symbol
		@type = type
		@colour = colour
		@letter = letter
		@moves = setup_moves(@type)
	end

	def setup_moves (type)
		output_moves = []
		case type
		when "queen"
			move_type = "expand"
			vectors = [
				[1,0],
				[-1,0],
				[0,1],
				[0,-1],
				[1,1],
				[1,-1],
				[-1,1],
				[-1,-1]
			]
		when "king"
			move_type = "step"
			vectors = [
				[1,0],
				[-1,0],
				[0,1],
				[0,-1],
				[1,1],
				[1,-1],
				[-1,1],
				[-1,-1]
			]
		when "pawn"
			move_type = "step"
			vectors = [
				[0,1]
			]
			move_type = "first_step"
			vectors = [
				[0,2]
			]
			move_type = "attack"
			vectors = [
				[1,1],
				[-1,1]
			]
		when "rook"
			move_type = "expand"
			vectors = [
				[1, 0],
				[-1, 0],
				[0, 1],
				[0, -1]
			]
		when "bishop"
			move_type = "expand"
			vectors = [
				[1,1],
				[-1,-1],
				[1,-1],
				[-1,1]
			]
		when "knight"
			move_type = "step"
			vectors = [
				[1,2],
				[1,-2],
				[-1,2],
				[-1,-2],
				[2,-1],
				[2,1],
				[-2,1],
				[-2,-1]
			]
		end
		vectors.each {|vector| output_moves.push(Move.new(move_type, vector))}
		return output_moves
	end
end

class Move
	def initialize (move_type, vector)
		@move_type = move_type
		@vector = vector
	end
end

# locate_moves() takes a square as argument. Accesses the piece on the square, the square's position, and the state of the board.
# Locate_moves parses the Move object passed in via the Piece object for the square.
# 

# Notes
# Because I've typed so many arrays, what if I wnated to convert them to another object, e.g. a vector from the matrix library?
# What if I wanted to convert them to my own defined Vector object. It would be doable, but perhaps in the future
# better to use Array.new, as then it is easy to change all at once to Object.new.

