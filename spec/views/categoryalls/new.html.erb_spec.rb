require 'spec_helper'

describe "categoryalls/new.html.erb" do
  before(:each) do
    assign(:categoryall, stub_model(Categoryall).as_new_record)
  end

  it "renders new categoryall form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categoryalls_path, :method => "post" do
    end
  end
end
