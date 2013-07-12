class CreateQuoteTags < ActiveRecord::Migration
  def change
  	create_table :quote_tags do |t|
  		t.integer :quote_id, :null => false
  		t.integer :tag_id, :null => false
  	end
  end
end
