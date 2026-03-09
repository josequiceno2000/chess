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
    @cursor = Gosu::Image.new(asset_path('cursor.png'))
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

  private

  def asset_path(file)
    File.join(ASSET_DIR, file)
  end
end

Game.new.show
