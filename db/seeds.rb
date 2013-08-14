# User.create(first_name: 'Eric',
#   last_name: 'Allen' ,
#   email: 'eric@allen.com',
#   password: 'ericallen')



def quote_parser(file)
  @quotes_hash = []
  quotes = File.read(file).split(/\n/)
  quotes.each_slice(3) do |rows|
    @quotes_hash << { quote: rows[0], author: rows[1]}
  end
  create_quotes
end

def create_quotes
	@quotes_hash.each do |hash|
		author_obj = Author.find_or_create_by(name: hash[:author])
		Quote.create(:body => hash[:quote], :author_id => Author.find_by_name(hash[:author]).id)
	end
end



filename = 'db/quotes.txt'
quote_parser(filename)
