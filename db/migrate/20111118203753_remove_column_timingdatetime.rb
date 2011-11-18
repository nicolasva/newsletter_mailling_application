class RemoveColumnTimingdatetime < ActiveRecord::Migration
  def up
	  remove_column :newsletters, :timingdatetime
  end
end
