class Screen
  def self.draw(coordinate_system)
    new(coordinate_system).draw
  end

  def initialize(coordinate_system)
    @coordinate_system = coordinate_system
  end

  attr_reader :coordinate_system

  def draw
    coordinate_system.height.times do |y|
      line = ""
      coordinate_system.width.times do |x|
        line << coordinate_system.value_at(x,y).to_s
      end
      puts line
    end
  end
end
