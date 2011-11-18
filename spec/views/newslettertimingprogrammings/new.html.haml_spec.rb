require 'spec_helper'

describe "newslettertimingprogrammings/new.html.haml" do
  before(:each) do
    assign(:newslettertimingprogramming, stub_model(Newslettertimingprogramming).as_new_record)
  end

  it "renders new newslettertimingprogramming form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newslettertimingprogrammings_path, :method => "post" do
    end
  end
end
