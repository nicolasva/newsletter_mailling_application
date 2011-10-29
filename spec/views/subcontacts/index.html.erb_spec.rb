require 'spec_helper'

describe "subcontacts/index.html.erb" do
  before(:each) do
    assign(:subcontacts, [
      stub_model(Subcontact),
      stub_model(Subcontact)
    ])
  end

  it "renders a list of subcontacts" do
    render
  end
end
