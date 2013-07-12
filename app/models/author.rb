class Author < ActiveRecord::Base
	has_many :quotes, :dependent => :destroy
	has_many :fans, :class_name => 'User', :through => :favorite_quotes
	has_many :popular_quotes, :class_name => 'FavoriteQuotes', :dependent => :destroy

	validates :name, :presence => true
	validates :name, :uniqueness => true
end

