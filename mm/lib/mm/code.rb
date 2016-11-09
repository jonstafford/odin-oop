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
end
