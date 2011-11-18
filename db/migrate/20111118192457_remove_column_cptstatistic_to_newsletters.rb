class RemoveColumnCptstatisticToNewsletters < ActiveRecord::Migration
  def up
	  remove_column :newsletters, :cptstatistic
  end
end
