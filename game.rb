["board.rb", "square.rb", "piece.rb"].each {|script| require_relative script}

class Game
	def move_piece(square)
		black_occupied = board.occupied_positions.black
		white_occupied = board.occupied_positions.white
		piece = square.piece.type
		colour = square.piece.colour

		if piece == "king"

			# possible_moves =
			# valid_positions = 
		end
	end	

	def get_move_vector(sqr)
		piece = sqr.piece
		pos = sqr.position
		case piece
		when "king"
			moves = [1,0,-1,1,-1].permutation(2).uniq.to_a
		when "queen"
			moves = []
		end
			

	end

	def get_valid_move(sqr)
		board_limits = [0,7]
		moves = [1,0,-1,1,-1].permutation(2).uniq.to_a
		destination_positions = []
		moves.each do |move|
			move = Vector::elements(move, copy=true)
			sqr_pos = Vector::elements(sqr.position, copy=true)
			destination_positions.push((sqr_pos + move).to_a)
		end

		piece = sqr.piece
		piece.colour == "black" ? enemy_colour = "white" : "black"
		require 'matrix'

		occupied_same = board.squares.flatten.select {|sqr| sqr.piece.colour == piece.colour}

		occupied_enemy = board.squares.flatten.select {|sqr| sqr.piece.colour == enemy_colour}

		potential_destinations = board.squares.flatten.select {|sqr| destination_positions.include?(sqr.position)} 
	end
end


b = Board.new

# b.display_board
# b.pieces
b.setup_board
b.display_board
piece = b.squares[0][1].piece
puts piece
# puts b.squares.flatten.select {|sqr| puts sqr.piece}
s = b.squares.flatten.select {|sqr| sqr.piece.colour == piece.colour}
s.each {|sqr| puts sqr.position.to_s}

def parse_moves (board, square)

end	