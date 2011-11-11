FactoryGirl.define do
	factory :newsletter do 
		mail
		mailstart
		categoryall
		name "newsletter"
		mailadd "nicolas.vandenbogaerde@gmail.com,nicolas.va@noos.fr"
		content "test envoie mail"
	end
end
