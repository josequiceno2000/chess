# frozen_string_literal: true

require 'gosu'

ASSET_PATH = File.expand_path('../assets', __dir__)

# Game class
class Game < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = 'Chess'
    board_image_path = File.join(ASSET_PATH, 'board_plain_01.png')
    @board_sprite = Gosu::Image.new(board_image_path)
    @x = 0
    @y = 0
  end

  def update
    # Game logic
  end

  def draw
    # Rendering
    @board_sprite.draw(@x, @y, 0)
  end
end

Game.new.show
