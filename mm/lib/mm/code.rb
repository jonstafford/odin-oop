require_relative 'board'

class Code
  # RGYBMC
  def initialize(str)
    @syms = []
    str.each_char do |c|
      @syms << c.upcase.to_sym
    end
  end
  
  def symbols
    @syms
  end
  
  public
  def assess(other_code)
    # These are for looking for pieces with the right color but in the wrong place
    other_placeless = []
    placeless = []
    
    # First we look for pieces with the right color in the right place
    place_and_color = 0
    other_code.symbols.each_with_index do |other_sym, i|
      if other_sym == @syms[i]
        place_and_color += 1
      else
        other_placeless << other_sym
        placeless << @syms[i]
      end
    end
    
    other_placeless.sort!
    placeless.sort!
    just_color = 0
    Board::CHOICES.split("").sort.each do |c|
      while !placeless.empty? && !other_placeless.empty? do
        
        starts = c == placeless[0].to_s
        other_starts = c == other_placeless[0].to_s
        
        if (starts && other_starts)
          
          placeless.shift
          other_placeless.shift
          just_color += 1
        elsif starts
          # shift off the placeless array any unmatched `c` characters
          while (!placeless.empty?) do 
            if (c == placeless[0].to_s)
              placeless.shift
            else
              break
            end  
          end
        elsif other_starts
          # shift off the other_placeless array any unmatched `c` characters
          while (!other_placeless.empty?) do
            if (c == other_placeless[0].to_s)
              other_placeless.shift
            else
              break
            end
          end
        else
          break
        end
      end
    end
    
    [place_and_color, just_color]
  end
end
