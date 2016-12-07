module Colors

  def color(text, terminal_effect)
    color = case (terminal_effect)
    when 31
      "red"
    when 32
      "green"
    when 33
      "yellow"
    when 34
      "blue"
    when 35
      "magenta"
    when 36
      "cyan"
    else
      "ERROR"
    end
    
    color_named(text, color)
  end
  
  def color_named(text, color, background=nil)
    bg = 
    if background.nil?
      ""
    else
      "; background:#{background}"
    end
    
    "<span style='color:#{color}#{bg}'>#{text}</span>"
  end
  
  def black(text)
    color_named(text, "black", "white")
  end
  
  def red(text)
    color_named(text, "red")
  end
  
  def green(text)
    color_named(text, "green")
  end
  
  def yellow(text)
    color_named(text, "yellow")
  end
  
  def blue(text)
    color_named(text, "blue")
  end
  
  def magenta(text)
    color_named(text, "magenta")
  end
  
  def cyan(text)
    color_named(text, "cyan")
  end
  
  def white(text)
    color_named(text, "white", "black")
  end
  
end