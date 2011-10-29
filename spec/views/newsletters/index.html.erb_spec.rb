require 'spec_helper'

describe "newsletters/index.html.erb" do
  before(:each) do
    assign(:newsletters, [
      stub_model(Newsletter),
      stub_model(Newsletter)
    ])
  end

  it "renders a list of newsletters" do
    render
  end
end
