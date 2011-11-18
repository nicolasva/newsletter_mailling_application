require 'spec_helper'

describe "statistics/index.html.haml" do
  before(:each) do
    assign(:statistics, [
      stub_model(Statistic),
      stub_model(Statistic)
    ])
  end

  it "renders a list of statistics" do
    render
  end
end
