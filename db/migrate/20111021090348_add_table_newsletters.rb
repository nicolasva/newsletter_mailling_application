class AddTableNewsletters < ActiveRecord::Migration
  def up
	  add_column :newsletters, :categoryall_id, :integer, :default => 1, :null => false

	  create_table "newsletters_subcontacts" do |t|
	  	t.integer "subcontact_id", :null => false
	        t.integer "newsletter_id", :null => false	
	  end

	  add_index "newsletters_subcontacts", ["subcontact_id"], :name => "newsletters_subcontacts_subcontact_id_to_subcontacts"
	  add_index "newsletters_subcontacts", ["newsletter_id"], :name => "newsletters_subcontacts_newsletter_id_to_subcontacts"
  end
end
