require 'spec_helper'

describe "mailstarts/edit.html.erb" do
  before(:each) do
    @mailstart = assign(:mailstart, stub_model(Mailstart))
  end

  it "renders the edit mailstart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mailstarts_path(@mailstart), :method => "post" do
    end
  end
end
