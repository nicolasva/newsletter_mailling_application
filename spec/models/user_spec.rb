require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:all) { @user = FactoryGirl.create(:user) }

  it { should allow_mass_assignment_of(:email, :username, :language, :updated_at, :mailstart_attributes) }
  it { should_not allow_mass_assignment_of(:created_at) }
  pending { should validate_format_of(:email).with(/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/) }
end
