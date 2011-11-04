class AddColumnPositionToSubcontacts < ActiveRecord::Migration
  def up
	 add_column :subcontacts, :position, :integer
  end
end
