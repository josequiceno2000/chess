# frozen_string_literal: true

require 'gosu'

# Game class
class Game < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = 'Chess'
  end

  def update
    # Game logic
  end

  def draw
    # Rendering
  end
end

Game.new.show
