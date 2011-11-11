FactoryGirl.define do
	factory :mailstart do
		user
		name "mailstarttest"
		sequence(:mail) {|n| "nicolas.vandenbogaerde_#{n}@gmail.com" }
	end
end
