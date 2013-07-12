class Quote < ActiveRecord::Base
 belongs_to :author
 has_many :readers, :class_name => 'User', :through => :favorite_quotes
 has_many :admirers, :class_name => 'User', :dependent => :destroy

 validates :author_id, :presence => true
 validates :body, :presence => true  # Remember to create a migration!
end