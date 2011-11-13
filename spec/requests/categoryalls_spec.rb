require 'spec_helper'

describe "Categoryalls" do
        before(:each) do
	        login_user
		@categoryall = Factory(:categoryall)
	end	
	
	it "edit categoryalli add categoryall (carnet d'adresse)" do
		visit edit_categoryall_path(@categoryall)
		page.should have_content("Adresse e-mail de départ")
		click_button "Ajouter une nouvelle catégorie"
		#page.should have_content "L'enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible"
	        notice("L'enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible")
	end

	it "edit categoryall add subcontact (carnet d'adresse)" do
		visit edit_categoryall_path(@categoryall)
		page.should have_content("Adresse e-mail de départ")
		click_button "Ajouter une nouvelle catégorie"
		notice("L'enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible")
		click_button "Ajouter un nouveau sous-contact"	
		notice("L'enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible")
	end

	it "edit categoryall add mail (carnet d'adresse)" do 
		visit edit_categoryall_path(@categoryall)
		page.should have_content("Adresse e-mail de départ")
		click_button "Ajouter une nouvelle catégorie"
		notice("L'enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible")
		click_button "Ajouter un nouveau sous-contact"	
		notice("L'enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible")
		click_button "Ajouter une nouvelle adresse e-mail"	
		notice("L'enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible")
	end
end
