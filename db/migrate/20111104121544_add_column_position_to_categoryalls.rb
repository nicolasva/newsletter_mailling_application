class AddColumnPositionToCategoryalls < ActiveRecord::Migration
  def up
	  add_column :categoryalls, :position, :integer 
  end
end
