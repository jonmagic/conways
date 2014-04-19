class Screen
  def self.draw(coordinate_system)
    new(coordinate_system).draw
  end

  def initialize(coordinate_system)
    @coordinate_system = coordinate_system
  end

  attr_reader :coordinate_system

  def draw
    0.upto(coordinate_system.height - 1) do |y|
      line = ""
      0.upto(coordinate_system.width - 1) do |x|
        line << coordinate_system.value_at(x,y).to_s
      end
      puts line
    end
  end
end
