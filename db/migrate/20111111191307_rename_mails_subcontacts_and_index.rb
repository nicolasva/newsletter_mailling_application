class RenameMailsSubcontactsAndIndex < ActiveRecord::Migration
  def up
	  remove_index(:mails_subcontacts, :name=>"mails_subcontacts_mail_id_to_mails")
	  rename_table(:mails_subcontacts, :emails_subcontacts)
	  rename_column(:emails_subcontacts, :mail_id, :email_id)
  
  end
end
