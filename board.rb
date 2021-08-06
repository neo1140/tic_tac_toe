# class for displaying and updating the board
class Board
  attr_reader :display
  def initialize
    @positions = [
      ' ', ' ', ' ',
      ' ', ' ', ' ',
      ' ', ' ', ' '
    ]
  end

  def build_board
    @display = "
    #{@positions[0]} | #{@positions[1]} | #{@positions[2]}
    ── ─── ──
    #{@positions[3]} | #{@positions[4]} | #{@positions[5]}
    ── ─── ──
    #{@positions[6]} | #{@positions[7]} | #{@positions[8]}
    "
    self.display
  end

  def update(position, value)
    @positions[position] = value
    self.build_board
  end
end
