FactoryGirl.define do
	factory :mailstart do
		association :user
		name "mailstarttest"
		sequence(:mail) {|n| "nicolas.vandenbogaerde_#{n}@gmail.com" }
	end
end
