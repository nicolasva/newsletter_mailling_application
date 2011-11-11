require 'spec_helper'

describe Categoryall do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:all) { @categoryall = FactoryGirl.create(:categoryall) } 
  it { should_not allow_mass_assignment_of(:created_at) }
  it { should allow_mass_assignment_of(:name, :subcontact_attributes, :updated_at, :position, :mailstart_attributes, :newsletter_attributes) }
end
