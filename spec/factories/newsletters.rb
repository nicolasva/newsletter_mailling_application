FactoryGirl.define do
	factory :newsletter do
	        after_create { |a| FactoryGirl.create(:subcontact, :newsletters => [a]) }	
		#after_create do |newsletter|
		#	newsletter.subcontact.save
		#end
	        mailstart
	        categoryall
		name "newsletter"
		mailadd "nicolas.vandenbogaerde@gmail.com,nicolas.va@noos.fr"
		content "test envoie mail"
	end
end
