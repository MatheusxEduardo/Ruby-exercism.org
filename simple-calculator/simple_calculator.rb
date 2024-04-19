class SimpleCalculator
  class UnsupportedOperation < StandardError; end
  
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  
  def self.calculate(first_operand, second_operand, operation)
    unless [Numeric, Integer, Float].include?(first_operand.class) && [Numeric, Integer, Float].include?(second_operand.class)
      raise ArgumentError, "Operands must be numeric."
    end
    
    unless ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation, "Operation '#{operation}' is not supported."
    end
    
    begin
      result = case operation
               when '+'
                 first_operand + second_operand
               when '-'
                 first_operand - second_operand
               when '*'
                 first_operand * second_operand
               when '/'
                 raise ZeroDivisionError, "Division by zero is not allowed." if second_operand == 0
                 first_operand / second_operand
               end
      
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError => e
      "Division by zero is not allowed."
    end
  end
end
