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
    
    # Now look for right colors in the wrong place
    just_color = 0
    
    # Hashes for how many of each color
    other_counts = Hash.new(0)
    counts = Hash.new(0)
    
    other_placeless.each do |sym|
      other_counts[sym] += 1
    end
    
    placeless.each do |sym|
      counts[sym] += 1
    end
    
    # Count of right color in wrong place is the overlap of the hashes
    other_counts.each do |other_sym, other_count|
      just_color += [other_count, counts[other_sym] || 0].min
    end
        
    [place_and_color, just_color]
  end
end
