class QuoteTag < ActiveRecord::Base
	belongs_to :quote
	belongs_to :tag
end
