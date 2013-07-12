class CreateFavoriteAuthors < ActiveRecord::Migration
  def change
  	create_table :favorite_authors do |t|
  		t.integer :user_id, :null => false
  		t.integer :author_id, :null => false
  		t.timestamps
  	end
  end
end
