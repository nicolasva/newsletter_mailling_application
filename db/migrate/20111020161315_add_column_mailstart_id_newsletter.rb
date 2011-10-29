class AddColumnMailstartIdNewsletter < ActiveRecord::Migration
  def up
	  add_column :newsletters, :mailstart_id, :integer, :default => 1, :null => false

	  add_index "newsletters", ["mailstart_id"], :name => "newsletters_mailstart_id_to_mailstarts"
  end
end
