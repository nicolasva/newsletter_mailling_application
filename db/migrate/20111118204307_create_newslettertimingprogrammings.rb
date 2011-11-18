class CreateNewslettertimingprogrammings < ActiveRecord::Migration
  def up
    create_table :newslettertimingprogrammings do |t|
      t.datetime :programmertimer, :null => true
      t.integer :newsletter_id, :null => false
      t.timestamps
    end

    add_index :newslettertimingprogrammings, [:newsletter_id], :name => "newslettertimingprogrammings_newsletter_id_to_newsletters"
  end
end
