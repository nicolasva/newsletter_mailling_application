class RemoveIndex < ActiveRecord::Migration
  def up
	  remove_index :emails_subcontacts, :name => "altered_emails_subcontacts_emails_id_to_emails"
  end
end
