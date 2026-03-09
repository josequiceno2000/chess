# frozen_string_literal: true

require 'gosu'

# Game class
class Game < Gosu::Window
  ASSET_DIR = File.expand_path('../assets', __dir__)

  def initialize
    super 1080, 600, fullscreen: true
    self.caption = 'Chess'

    @background = Gosu::Image.new(asset_path('background.gif'), :tileable => true)
    @board = Gosu::Image.new(asset_path('board.png'))

    @bg_scale_x = width.to_f / @background.width
    @bg_scale_y = height.to_f / @background.height

    @board_x = (width - @board.width) / 2.0
    @board_y = (height - @board.height) / 2.0
  end

  def update
    # Game logic
    close if Gosu.button_down?(Gosu::KB_ESCAPE)
  end

  def draw
    # Rendering

    @background.draw(0, 0, -1, @bg_scale_x, @bg_scale_y)
    @board.draw(@board_x, @board_y, 0)
  end

  private

  def asset_path(file)
    File.join(ASSET_DIR, file)
  end
end

Game.new.show

# def load_pieces
#   @pieces = {}
#   # Example: loading a white pawn
#   @pieces[:white_pawn] = Gosu::Image.new(asset_path('pawn_white.png'))
#   # Then draw it with: @pieces[:white_pawn].draw(x, y, z)
# end