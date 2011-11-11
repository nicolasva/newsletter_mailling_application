class RenameTableMailsToEmails < ActiveRecord::Migration
  def up
      rename_table(:mails, :emails)
      rename_column(:emails, :email, :addr_email)
  end
end
