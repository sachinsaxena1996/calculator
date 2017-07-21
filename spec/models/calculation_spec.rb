require 'rails_helper'

RSpec.describe Calculation, type: :model do
  it "evaluates the expression correctly" do
    c1 = Calculation.new
    expect(c1.evaluate_string('5*3+1+6/2+9*100')). to eq(919)
  end
end
