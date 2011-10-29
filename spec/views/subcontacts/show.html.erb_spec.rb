require 'spec_helper'

describe "subcontacts/show.html.erb" do
  before(:each) do
    @subcontact = assign(:subcontact, stub_model(Subcontact))
  end

  it "renders attributes in <p>" do
    render
  end
end
