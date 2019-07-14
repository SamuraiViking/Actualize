WHALE = <<END
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

def ascii_with_environment(ascii, environment)
  ascii = ascii.split("\n")
  ascii.each_index do |i|
    puts ascii[i]
    # ascii[i] = ascii[i].gsub(/\s/, environment)
  end
  @ascii
end

ascii_with_environment(WHALE,'+')
