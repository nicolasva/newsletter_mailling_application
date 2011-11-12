require 'spec_helper'

describe "Mailstarts" do
	before(:each) do
		login_user
		@mailstart = Factory(:mailstart)
	end

	it "list all mailstarts" do
	      visit mailstarts_path
	      page.should have_content("Nom du mail de départ")
	      page.should have_link("Creer un nouveau carnet d'adresse", :href => new_mailstart_path)
	end

	it "create mailstart" do
	      visit mailstarts_path
	      click_link "Creer un nouveau carnet d'adresse"
	      page.should have_content("Adresse e-mail de départ")
	end

	it "edit mailstart" do
	      visit edit_mailstart_path(@mailstart)
	      page.should have_content("Adresse e-mail de départ")
	      click_button "Enregistrer les informations concernant ce carnet d'adresse"
	      page.should have_content("enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible")
	      page.should have_content("Gestion du carnet d'adresse") 
	end

	it "click edit mailstart button add category subcontact mail" do
	     visit edit_mailstart_path(@mailstart)
	     click_button "Ajouter une nouvelle catégorie"
	     page.should have_content("L'enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible")
	     categoryall = Factory(:categoryall)
	     click_button "Ajouter un nouveau sous-contact"
	     page.should have_content("L'enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible")
	     click_button "Ajouter une nouvelle adresse e-mail"
	     page.should have_content("L'enregistrement concernant les information de ce carnet d'adresse s'est bien déroulé, elles sont désormais disponible")
	end
end
