class RPNExpression
  # Returns an object representing the supplied RPN expression
  #
  # @param expr [String] an RPN expression, e.g., "5 4 +"
  def initialize(expr)
    @expr = expr
  end

  # Evaluates the underlying RPN expression and returns the final result as a
  # number.
  #
  # @return [Numeric] the evaluated RPN expression
  def evaluate
    stack = []
    @expr.split.each do |i|
      case i
      when /\d/
        stack.push(i.to_i)
      when "+", "-", "*", "/"
        operands = stack.pop(2)
        stack.push(operands[0].send(i, operands[1]))
      end
    end
    stack.pop
  end
end
