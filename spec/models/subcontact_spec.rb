require 'spec_helper'

describe Subcontact do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:all) { @subcontact = Subcontact.create(:subcontact) }
  it { should_not allow_mass_assignment_of(:created_at) }
  it { should allow_mass_assignment_of(:name, :updated_at, :position, :categoryall_attributes, :email_attributes) }
end
