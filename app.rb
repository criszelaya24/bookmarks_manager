require 'sinatra/base'
require_relative 'lib/bookmark.rb'
require_relative './database_connection_setup.rb'

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

	patch '/bookmarks/:id' do
		Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
		redirect('/bookmarks')
	end
						# End Method for CRUD

	get '/bookmarks' do
		@bookmarks = Bookmark.all
		erb :'bookmarks/index'
	end

	get '/bookmarks/new' do
		erb :'bookmarks/new'
	end

	get '/bookmarks/:id/edit' do
		@bookmark = Bookmark.find(id: params[:id])
		erb(:'/bookmarks/edit')
	end

	run! if app_file == $0
end