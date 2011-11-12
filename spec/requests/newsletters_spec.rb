require 'spec_helper'

describe "Newsletters" do
  #before (:each) do
  #	@user = Factory.create(:user)
  #	sign_in @user
  #end

  #describe "GET /newsletters" do
   # it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #  get newsletters_path
    #  response.status.should be(200)
    #end
  #end
  before(:each) do 
  	login_user
    	@newsletter = Factory(:newsletter)
  end

  it "list all newsletters" do
  	visit newsletters_path
	page.should have_link("Apperçu de la newsletter")
	page.should have_link("", :href=>edit_newsletter_path(@newsletter))
  end

  it "show_newsletter" do 
  	visit newsletters_path
    	click_link "Apperçu de la newsletter"
	page.should have_content("Email de départ")
  end

  it "edit newsletter" do
	visit edit_newsletter_path(@newsletter)
        select "mailstarttest", :from => "Mailstart"
        #select "categoryalltest", :from => "Categoryall"	
	fill_in "newsletter[name]", :with=>"testnicolas"
        click_button "Modifier cette newsletter"  
  end

  it "new newsletter register" do
  	visit new_newsletter_path
	page.should have_content("Nouvelle newsletter")
        select "mailstarttest", :label => "Mailstart"
	#select "categoryalltest", :label => "Categoryall"
	fill_in "Titre de la newsletter", :with => "testnicolas" 
        fill_in "Contenu", :with=>"Test de l'enregistrement de la newsletter"
        click_button "Enregistrer cette newsletter" 	
  end
end
