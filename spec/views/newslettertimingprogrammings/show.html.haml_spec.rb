require 'spec_helper'

describe "newslettertimingprogrammings/show.html.haml" do
  before(:each) do
    @newslettertimingprogramming = assign(:newslettertimingprogramming, stub_model(Newslettertimingprogramming))
  end

  it "renders attributes in <p>" do
    render
  end
end
