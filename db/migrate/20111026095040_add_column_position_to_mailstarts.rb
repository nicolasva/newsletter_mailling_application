class AddColumnPositionToMailstarts < ActiveRecord::Migration
  def up
	  add_column :mailstarts, :position, :integer
  end
end
