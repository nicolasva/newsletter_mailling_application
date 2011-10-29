require 'spec_helper'

describe "categoryalls/index.html.erb" do
  before(:each) do
    assign(:categoryalls, [
      stub_model(Categoryall),
      stub_model(Categoryall)
    ])
  end

  it "renders a list of categoryalls" do
    render
  end
end
