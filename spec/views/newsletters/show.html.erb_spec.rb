require 'spec_helper'

describe "newsletters/show.html.erb" do
  before(:each) do
    @newsletter = assign(:newsletter, stub_model(Newsletter))
  end

  it "renders attributes in <p>" do
    render
  end
end
