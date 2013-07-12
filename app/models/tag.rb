class Tag < ActiveRecord::Base
	has_many :quotes, :through => :quote_tags
	belongs_to :quote_tags, :dependent => :destroy

	validates :name, :presence => true
end
