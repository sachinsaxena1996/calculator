class Calculation < ApplicationRecord
  def evaluate_string(calculation_string)
    # 5*3+1+6/2+9*100
    new_calc_str = calculation_string.split('+')
    calc_output = 0
    new_calc_str.each do |elem|
      if elem.length > 1 && !elem.index('*').nil?
        arr = elem.split('*')
        calc_output = calc_output + (arr[0].to_i * arr[1].to_i)
      elsif elem.length > 1 && !elem.index('/').nil?
        arr = elem.split('/')
        calc_output = calc_output + (arr[0].to_i / arr[1].to_i)
      elsif elem.length > 1 && !elem.index('-').nil?
        arr = elem.split('-')
        calc_output = calc_output + (arr[0].to_i - arr[1].to_i)
      else
        calc_output = calc_output + elem.to_i
      end
    end
    calc_output
  end
end
