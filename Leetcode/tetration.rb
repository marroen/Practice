class Tetration
  include Math
  a = 0
  def tetrate(n)
    a = n**(1/n)
  end
  a
end

inp = gets.to_f
t = Tetration.new
p t.tetrate(inp)