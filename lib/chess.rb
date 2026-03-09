# frozen_string_literal: true

require 'gosu'

ASSET_PATH = File.expand_path('../assets', __dir__)

# Game class
class Game < Gosu::Window
  BOARD_PATH = File.join(ASSET_PATH, 'board_plain_03.png')
  CURSOR_PATH = File.join(ASSET_PATH, 'cursor.png')
  BACKGROUND_PATH = File.join(ASSET_PATH, 'background.gif')

  def initialize
    super 1080, 600, fullscreen: true
    self.caption = 'Chess'
    @background = Gosu::Image.new(BACKGROUND_PATH, :tileable => true)
    @board = Gosu::Image.new(BOARD_PATH)
    @cursor = Gosu::Image.new(CURSOR_PATH)
  end

  def update
    # Game logic
    close if Gosu.button_down?(Gosu::KB_ESCAPE)
  end

  def draw
    # Rendering

    @background.draw(
      0,
      0,
      -1,
      width.to_f / @background.width, 
      height.to_f / @background.height
    )
    @board.draw(0, 0, 0)
    @cursor.draw(20, 20, 1)
  end
end

Game.new.show
