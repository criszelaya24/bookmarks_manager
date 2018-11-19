require 'sinatra/base'

class BookmarkManager < Sinatra::Base
	get '/' do
		'Bookmarks Manager'
	end

	run! if app_file == $0
end