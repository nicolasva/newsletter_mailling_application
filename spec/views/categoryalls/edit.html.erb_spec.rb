require 'spec_helper'

describe "categoryalls/edit.html.erb" do
  before(:each) do
    @categoryall = assign(:categoryall, stub_model(Categoryall))
  end

  it "renders the edit categoryall form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categoryalls_path(@categoryall), :method => "post" do
    end
  end
end
