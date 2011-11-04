class AddColumnPositionToMails < ActiveRecord::Migration
  def change
  	add_column :mails, :position, :integer
  end
end
