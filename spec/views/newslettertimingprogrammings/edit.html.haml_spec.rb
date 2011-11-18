require 'spec_helper'

describe "newslettertimingprogrammings/edit.html.haml" do
  before(:each) do
    @newslettertimingprogramming = assign(:newslettertimingprogramming, stub_model(Newslettertimingprogramming))
  end

  it "renders the edit newslettertimingprogramming form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newslettertimingprogrammings_path(@newslettertimingprogramming), :method => "post" do
    end
  end
end
