require 'spec_helper'

describe "mailstarts/show.html.erb" do
  before(:each) do
    @mailstart = assign(:mailstart, stub_model(Mailstart))
  end

  it "renders attributes in <p>" do
    render
  end
end
