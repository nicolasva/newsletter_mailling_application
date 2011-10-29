class UpdateColumnNewsletterContent < ActiveRecord::Migration
  def up
	  change_column(:newsletters, :content, :text, :null => false)
  end
end
