require 'spec_helper'

describe "mails/index.html.erb" do
  before(:each) do
    assign(:mails, [
      stub_model(Mail),
      stub_model(Mail)
    ])
  end

  it "renders a list of mails" do
    render
  end
end
