require 'spec_helper'

describe "statistics/new.html.haml" do
  before(:each) do
    assign(:statistic, stub_model(Statistic).as_new_record)
  end

  it "renders new statistic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => statistics_path, :method => "post" do
    end
  end
end
