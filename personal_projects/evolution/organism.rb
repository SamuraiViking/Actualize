class Organism
  attr_reader :pos, :ascii, :height
  attr_writer :pos

  def initialize(x, y)
    @pos = { x: 0, y: 0 }
    @mov = { x: 0, y: 0 }
  @ascii = <<END
                   \\    /
                    \\  /
|\\\  //|              ||
 \ \/  /               ||
  |   |              ||
  |   |              ||
   \\   \\------------------------\\
    \\                       o    \\
      \\                            \\
       \\                 \\__________\\
        \\                          /
         \\________________________/
END
    @ascii_with_environment = ascii_with_environment('~')
    @height = @ascii.length
    @width = @ascii[0].length
  end

  def ascii_with_environment(environment)
    @ascii = ascii.split("\n")
    @ascii.each_index do |i|
      # ascii[i] = ascii[i].gsub(/\s/, environment)
    end
    @ascii
  end

  def move
    @mov[:x] = 0
    @mov[:y] = 0
    @pos[:x] += @mov[:x]
    @pos[:y] += @mov[:y]
  end
end


