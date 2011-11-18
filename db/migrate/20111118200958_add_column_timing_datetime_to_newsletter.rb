class AddColumnTimingDatetimeToNewsletter < ActiveRecord::Migration
  def up
	 add_column :newsletters, :timingdatetime, :datetime, :null=>true
  end
end
