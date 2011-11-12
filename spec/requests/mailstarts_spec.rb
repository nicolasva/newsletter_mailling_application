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

	it "edit mailstart" do
	      visit edit_mailstart_path(@mailstart)
	end
end
