require 'spec_helper'

describe "statistics/edit.html.haml" do
  before(:each) do
    @statistic = assign(:statistic, stub_model(Statistic))
  end

  it "renders the edit statistic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => statistics_path(@statistic), :method => "post" do
    end
  end
end
