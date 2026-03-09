# frozen_string_literal: true

require 'gosu'

ASSET_PATH = File.expand_path('../assets', __dir__)

# Game class
class Game < Gosu::Window
  def initialize
    super 640, 480, fullscreen: true
    self.caption = 'Chess'
    board_image_path = File.join(ASSET_PATH, 'board_plain_03.png')
    cursor_image_path = File.join(ASSET_PATH, 'cursor.png')
    @board = Gosu::Image.new(board_image_path)
    @cursor = Gosu::Image.new(cursor_image_path)
  end

  def update
    # Game logic
    close if Gosu.button_down?(Gosu::KB_ESCAPE)
  end

  def draw
    # Rendering
    @board.draw(0, 0, 0)
    @cursor.draw(20, 20, 1)
  end
end

Game.new.show
