require 'spec_helper'

describe Mailstart do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:all) { @mailstart = FactoryGirl.create(:mailstart) }

  it { should_not allow_mass_assignment_of(:created_at) }
  it { should allow_mass_assignment_of(:name, :mail, :updated_at, :position, :categoryall_attributes, :newsletter_attributes) }
end
