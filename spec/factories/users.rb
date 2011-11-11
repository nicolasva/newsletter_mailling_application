FactoryGirl.define do
	factory :user do
		sequence(:email) {|n| "nicolas.vandenbogaerde#{n}@gmail.com" }
	        sequence(:username) {|n| "nicolas_#{n}" }
		password "infonies"
		language 'fr'
	end
end
