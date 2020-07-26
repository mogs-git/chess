class Square
	attr_accessor :position, :piece

	def initialize (position)
		@position = position
		@piece = Piece.new(nil, " ", nil, nil, nil)
	end
end