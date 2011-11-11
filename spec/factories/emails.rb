FactoryGirl.define do
	factory :email do
		#subcontact
		after_create { |a| FactoryGirl.create(:subcontact, :emails => [a]) }
		after_create { |a| FactoryGirl.create(:newsletter, :emails => [a]) }
		#after_create do |email|
		#	email.subcontact.save
		#	email.newsletter.save
		#end
		association :newsletter
		name "VANDENBOGAERDE Nicolas"
		adress "30 Rue François Arago"
		cppostal "93500"
		tel "0681144589"
		sequence(:email) {|n| "nicolas.vandenbogaerde_#{n}@gmail.com" }
	end
end
