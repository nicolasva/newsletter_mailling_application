class AddTableStatistics < ActiveRecord::Migration
  def up
     create_table "statistics", :force => true do |t|
     	t.string "ip", :default => "" , :null=> false
	t.String "localization", :default => "", :null => false

     end
  end
end
