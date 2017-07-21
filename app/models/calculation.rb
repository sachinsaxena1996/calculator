class Calculation < ApplicationRecord
  def evaluate_string(input)
    values = []
    operators = []
    input = input.scan(/\w+|\W/)
    input.each_with_index do |token, index|
      if ((token != "*") && (token != "+") && (token != "-") && (token != "/"))
        input[index] = token.to_i
      end
    end
    input.each do |val|
      if val.class == Fixnum
        values << val
      elsif val.class == String
        if (val == '+' || val == '-') && (operators.last == '*')
          calc = 0
          calc = values[-2] * values[-1]
          values.pop
          values.pop
          values << calc
          operators.pop
          redo
        elsif (val == '+' || val == '-') && (operators.last == '/')
          calc = 0
          calc = values[-2] / values[-1]
          values.pop
          values.pop
          values << calc
          operators.pop
          redo
        elsif (val == '+' || val == '-') && (operators.last == '+')
          calc = 0
          calc = values[-2] + values[-1]
          values.pop
          values.pop
          values << calc
          operators.pop
          redo
        elsif (val == '+' || val == '-') && (operators.last == '-')
          calc = 0
          calc = values[-2] - values[-1]
          values.pop
          values.pop
          values << calc
          operators.pop
          redo
        else
          operators.push(val)
        end
      end
    end

    output = 0
    if values.length > 2
      output = values[-2].send(operators[-1], values[-1]) if !operators[-1].nil?
      output = output.send(operators[0], values[0]) if !operators[0].nil?
    else
      output = values[0].send(operators[0], values[1])
    end
    output
  end
end
