require 'spec_helper'

describe Email do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:all) { @email = Email.create(:mail) }
  it { should allow_mass_assignment_of(:name, :adress, :cppostal, :tel, :addr_email, :updated_at, :position, :subcontact_attributes, :newsletter_attributes) }
  it { should_not allow_mass_assignment_of(:created_at) }
end
