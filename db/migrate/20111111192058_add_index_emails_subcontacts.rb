class AddIndexEmailsSubcontacts < ActiveRecord::Migration
  def up
	 add_index :emails_subcontacts, ["email_id"], :name=>"emails_subcontacts_emails_id_to_emails"
	 remove_column :emails_subcontacts, :name=>"mails_subcontacts_subcontact_id_to_subcontacts"
	 add_index :emails_subcontacts, [:subcontact_id], :name=>"emails_subcontacts_subcontact_id_to_subcontacts"
  end
end
