class CreateFavoriteQuotes < ActiveRecord::Migration
  def change
  	create_table :favorite_quotes do |t|
  		t.integer :user_id, :null => false
  		t.integer :quote_id, :null => false
  		t.timestamps
  	end
  end
end
