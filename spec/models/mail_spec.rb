require 'spec_helper'

describe Mail do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:all) { @mail = Mail.create(:mail) }
  it { should allow_mass_assignment_of(:name, :adress, :cppostal, :tel, :email, :updated_at, :position, :subcontact_attributes, :newsletter_attributes) }
  it { should_not allow_mass_assignment_of(:created_at) }
end
