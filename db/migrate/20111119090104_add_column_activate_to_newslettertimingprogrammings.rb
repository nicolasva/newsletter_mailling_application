class AddColumnActivateToNewslettertimingprogrammings < ActiveRecord::Migration
  def up
	  add_column(:newslettertimingprogrammings, :activate, :boolean, :default=>true, :null=>false)
  end
end
