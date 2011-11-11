require 'spec_helper'

describe Newsletter do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:all) { @newsletter = FactoryGirl.create(:newsletter) }

  it { should_not allow_mass_assignment_of(:created_at) }
  it { should allow_mass_assignment_of(:name, :mailadd, :content, :updated_at, :cptstatistic, :mails, :email_attributes) }
end
