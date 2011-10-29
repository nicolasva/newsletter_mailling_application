require 'spec_helper'

describe "mailstarts/index.html.erb" do
  before(:each) do
    assign(:mailstarts, [
      stub_model(Mailstart),
      stub_model(Mailstart)
    ])
  end

  it "renders a list of mailstarts" do
    render
  end
end
