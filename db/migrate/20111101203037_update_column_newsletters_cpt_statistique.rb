class UpdateColumnNewslettersCptStatistique < ActiveRecord::Migration
  def up
	  rename_column :newsletters, :cptstatistique, :cptstatistic
	  change_column :newsletters, :cptstatistic, :integer, :default => 0, :null => true
  end
end
