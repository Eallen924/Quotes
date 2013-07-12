class CreateQuotes < ActiveRecord::Migration
  def change
  	create_table :quotes do |t|
  		t.text :body, :null => false
  		t.integer :author_id, :null => false
  		t.timestamps
  	end
  end
end
