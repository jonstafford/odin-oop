module Colors
  
  def color(text, effect, background=nil)
    bg = 
    if background.nil?
      ""
    else
      ";" + background.to_s
    end
    "\e[#{effect}#{bg}m#{text}\e[0m"
  end
  
  def black(text)
    color(text, 30, 47)
  end
  
  def red(text)
    color(text, 31)
  end
  
  def green(text)
    color(text, 32)
  end
  
  def yellow(text)
    color(text, 33)
  end
  
  def blue(text)
    color(text, 34)
  end
  
  def magenta(text)
    color(text, 35)
  end
  
  def cyan(text)
    color(text, 36)
  end
  
  def white(text)
    color(text, 37, 40)
  end
  
end