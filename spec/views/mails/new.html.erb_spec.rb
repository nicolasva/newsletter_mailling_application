require 'spec_helper'

describe "mails/new.html.erb" do
  before(:each) do
    assign(:mail, stub_model(Mail).as_new_record)
  end

  it "renders new mail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mails_path, :method => "post" do
    end
  end
end
