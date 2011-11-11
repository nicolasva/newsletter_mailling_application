FactoryGirl.define do
	factory :categoryall do
		after_create {|a| FactoryGirl.create(:subcontact, :categoryalls => [a]) }
		#after_create do |categoryall|
		#	categoryall.subcontact.save
		#end
		association :mailstart
		name "categoryalltest"
	end
end
