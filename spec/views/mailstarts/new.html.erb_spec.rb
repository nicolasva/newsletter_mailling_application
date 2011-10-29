require 'spec_helper'

describe "mailstarts/new.html.erb" do
  before(:each) do
    assign(:mailstart, stub_model(Mailstart).as_new_record)
  end

  it "renders new mailstart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mailstarts_path, :method => "post" do
    end
  end
end
