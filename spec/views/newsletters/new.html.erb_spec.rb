require 'spec_helper'

describe "newsletters/new.html.erb" do
  before(:each) do
    assign(:newsletter, stub_model(Newsletter).as_new_record)
  end

  it "renders new newsletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newsletters_path, :method => "post" do
    end
  end
end
