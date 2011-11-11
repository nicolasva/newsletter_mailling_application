class MailsNewslettersToEmailsNewsletters < ActiveRecord::Migration
  def up
	rename_table(:mails_newsletters, :emails_newsletters)
	rename_column(:emails_newsletters, :mail_id, :email_id)
        add_index "emails_newsletters", ["email_id"], :name=>"emails_newsletters_email_id"
	add_index "emails_newsletters", ["newsletter_id"], :name=>"emails_newsletters_newsletter_id"

	remove_index :emails_subcontacts, :name =>"mails_subcontacts_subcontact_id_to_subcontacts"
	add_index :emails_subcontacts, ["email_id"], :name=>"emails_subcontacts_email_id_to_mails"
  end
end
