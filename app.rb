require 'sinatra/base'
require_relative 'lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
	enable :sessions, :method_override

	get '/' do
		erb(:'/bookmarks/welcome')
	end
						# Method for CRUD
	post '/bookmarks' do
		Bookmark.create(url: params[:url], title: params[:title])
		redirect '/bookmarks'
	end

	delete '/bookmarks/:id' do
		Bookmark.delete(id: params[:id])
		redirect '/bookmarks'
	end
						# End Method for CRUD

	get '/bookmarks' do
		@bookmarks = Bookmark.all
		erb :'bookmarks/index'
	end

	get '/bookmarks/new' do
		erb :'bookmarks/new'
	end

	run! if app_file == $0
end