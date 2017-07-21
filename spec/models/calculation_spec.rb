require 'rails_helper'

RSpec.describe Calculation, type: :model do
  it "evaluates the expression correctly" do
    c1 = Calculation.new
    expect(c1.evaluate_string('5*3+1+6/2+9*100')). to eq(919)
    expect(c1.evaluate_string('5*3+1+6/85+9*100')). to eq(916)
    expect(c1.evaluate_string('6/2-5*3+1+9*100')). to eq(889)
  end
end
