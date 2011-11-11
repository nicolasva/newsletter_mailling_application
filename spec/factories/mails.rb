FactoryGirl.define do
	factory :mail do
		subcontact
		newsletter
		name "VANDENBOGAERDE Nicolas"
		adress "30 Rue François Arago"
		cppostal "93500"
		tel "0681144589"
		sequence(:email) {|n| "nicolas.vandenbogaerde_#{n}@gmail.com" }
	end
end
