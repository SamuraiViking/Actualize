require_relative 'colorized'
require_relative 'ascii'
require_relative 'organism'

class Ecosystem
  def initialize(input_options)
    @width = input_options[:width]
    @height = input_options[:height]
    @population = input_options[:population]

    @environment = no_organism_environment
    @organisms = init_organisms
  end

  def init_organisms
    organisms = []
    @population.times do |i|
      organisms << Organism.new(rand(@width / 2), rand(@height / 2))
    end
    organisms
  end

  def no_organism_environment
    environemnt = []
    @height.times do
      row = []
      @width.times do
        row << blue('`')
      end
      environemnt << row
    end
    environemnt
  end

  def simulate
    loop do
      fps(2)
      clear_screen
      place_organisms
      print_ecosystem
      clear_organisms
      move_organisms
    end
  end

  def fps(frames)
    sleep(1.0 / frames)
  end

  def clear_screen
    puts "\n" * 10
  end

  def place_organisms
    @organisms.each do |organism|
      column = organism.pos[:x]
      row = organism.pos[:y]
      ascii = organism.ascii
      # ascii = ascii.split("\n")
      height = ascii.length

      if height + row <= @height
        height.times do |i|
          @environment[row + i][column] = ascii[i].chars
          @environment[row + i] = @environment[row + i].flatten
        end
      end
    end
  end

  def print_ecosystem
    output = ''
    @environment.each do |row|
      row_str = ''
      row.each.with_index do |tile, i|
        row_str += tile if i < @width
      end
      output += row_str + "\n"
    end
    puts output
  end

  def move_organisms
    @organisms.each do |organism|
      organism.move

      if organism.pos[:x] >= @width
        organism.pos[:x] = @width
      end

      if organism.pos[:x] <= -1
        organism.pos[:x] = 0
      end

      if organism.pos[:y] + organism.height >= @height
        organism.pos[:y] = @height - organism.height - 1
      end

      if organism.pos[:y] <= -1
        organism.pos[:y] = 0
      end
    end
  end

  def clear_organisms
    @environment = no_organism_environment
  end
end

input_options = {
  width: 50,
  height: 20,
  population: 1
}

ecosystem = Ecosystem.new(input_options)

ecosystem.simulate
