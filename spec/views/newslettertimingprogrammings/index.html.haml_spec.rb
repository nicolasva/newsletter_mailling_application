require 'spec_helper'

describe "newslettertimingprogrammings/index.html.haml" do
  before(:each) do
    assign(:newslettertimingprogrammings, [
      stub_model(Newslettertimingprogramming),
      stub_model(Newslettertimingprogramming)
    ])
  end

  it "renders a list of newslettertimingprogrammings" do
    render
  end
end
