require 'spec_helper'

describe "statistics/show.html.haml" do
  before(:each) do
    @statistic = assign(:statistic, stub_model(Statistic))
  end

  it "renders attributes in <p>" do
    render
  end
end
