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

    @tile_size = (@board.width - 34) / 8.0

    load_pieces

    @piece_scale = (@tile_size * 0.6) / @piece_images[:pawn_white].width

    setup_board
  end

  def setup_board
    @grid = Array.new(8) { Array.new(8) }

    back_row = %i[rook knight bishop queen king bishop knight rook]

    back_row.each_with_index { |type, col| @grid[0][col] = :"#{type}_black" }
    8.times { |col| @grid[1][col] = :pawn_black }

    8.times { |col| @grid[6][col] = :pawn_white }
    back_row.each_with_index { |type, col| @grid[7][col] = :"#{type}_white"}
  end

  def update
    # Game logic
    close if Gosu.button_down?(Gosu::KB_ESCAPE)
  end

  def draw
    # Rendering

    @background.draw(0, 0, -1, @bg_scale_x, @bg_scale_y)
    @board.draw(@board_x, @board_y, 0)

    @grid.each_with_index do |row_array, row_index|
      row_array.each_with_index do |piece_key, col_index|
        draw_piece(col_index, row_index, piece_key) if piece_key
      end
    end
  end

  def load_pieces
    @piece_images = {}
    colors = %w[white black]
    types = %w[pawn rook knight bishop queen king]

    colors.each do |color|
      types.each do |type|
        key = "#{type}_#{color}".to_sym
        filename = "#{key}.png"
        @piece_images[key] = Gosu::Image.new(asset_path(filename))
      end
    end
  end

  def draw_piece(column, row, piece_key)
    image = @piece_images[piece_key]

    x_pos = @board_x + (column * @tile_size) + 34
    y_pos = @board_y + (row * @tile_size) + 34

    image.draw_rot(x_pos, y_pos, 1, 0, 0.5, 0.5, @piece_scale, @piece_scale)
  end

  private

  def asset_path(file)
    File.join(ASSET_DIR, file)
  end
end

Game.new.show
