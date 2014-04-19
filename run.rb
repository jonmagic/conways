require_relative "lib/game"
require_relative "lib/screen"

game = Game.new(20, 20)

# blink
game.set_live_cell_at 9, 10
game.set_live_cell_at 10, 10
game.set_live_cell_at 11, 10

# glider
game.set_live_cell_at 0, 1
game.set_live_cell_at 1, 2
game.set_live_cell_at 2, 2
game.set_live_cell_at 2, 1
game.set_live_cell_at 2, 0

loop do
  puts "\e[H\e[2J"
  Screen.draw(game)
  game.tick
  sleep 0.2
end
