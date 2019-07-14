def random_char
  chars = ('!'..'}').to_a
  num_of_chars = chars.length
  random_char = rand(num_of_chars - 1)
  chars[random_char]
end

SHARK = <<-END
\\_____)\\______
/--v___'''__`<
       )/
END

WHALE = <<END
                   \\    /
                    \\  /
|\\\  //|             ||
 \ \/  /             ||
  |   |              ||
  |   |              ||
   \\   \\------------------------\
    \\                       o    \
     \\-                           \
      \\                 \\__________\
       \\-                          /
         \\________________________/
END
