class AddColumnUserLanguage < ActiveRecord::Migration
  def up
	add_column :users, :language, :string, :default => "fr"
  end
end
