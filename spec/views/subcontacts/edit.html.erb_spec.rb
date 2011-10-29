require 'spec_helper'

describe "subcontacts/edit.html.erb" do
  before(:each) do
    @subcontact = assign(:subcontact, stub_model(Subcontact))
  end

  it "renders the edit subcontact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subcontacts_path(@subcontact), :method => "post" do
    end
  end
end
