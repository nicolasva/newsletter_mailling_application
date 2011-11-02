class AddColumnNewslettersCptStatistique < ActiveRecord::Migration
  def up
	  add_column :newsletters, :cptstatistique, :integer, :null=>true
  end
end
