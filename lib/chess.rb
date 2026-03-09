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

    @bg_scale_x = width.to_f / @background.width
    @bg_scale_y = height.to_f / @background.height
  end

  def update
    # Game logic
    close if Gosu.button_down?(Gosu::KB_ESCAPE)
  end

  def draw
    # Rendering

    @background.draw(0, 0, -1, @bg_scale_x, @bg_scale_y)
    @board.draw(0, 0, 0)
    @cursor.draw(20, 20, 1)
  end

  private

  def asset_path(file)
    File.join(ASSET_DIR, file)
  end
end

Game.new.show
