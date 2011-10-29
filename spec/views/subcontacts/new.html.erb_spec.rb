require 'spec_helper'

describe "subcontacts/new.html.erb" do
  before(:each) do
    assign(:subcontact, stub_model(Subcontact).as_new_record)
  end

  it "renders new subcontact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subcontacts_path, :method => "post" do
    end
  end
end
