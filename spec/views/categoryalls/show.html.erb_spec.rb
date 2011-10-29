require 'spec_helper'

describe "categoryalls/show.html.erb" do
  before(:each) do
    @categoryall = assign(:categoryall, stub_model(Categoryall))
  end

  it "renders attributes in <p>" do
    render
  end
end
