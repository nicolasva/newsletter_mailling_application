require 'spec_helper'

describe "newsletters/edit.html.erb" do
  before(:each) do
    @newsletter = assign(:newsletter, stub_model(Newsletter))
  end

  it "renders the edit newsletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newsletters_path(@newsletter), :method => "post" do
    end
  end
end
