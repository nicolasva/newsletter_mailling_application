class RenameColumnMailToTableMail < ActiveRecord::Migration
  def up
	  rename_column :mails, :mail, :email
  end

  def down
  end
end
