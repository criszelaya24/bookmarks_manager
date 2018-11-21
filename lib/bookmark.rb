require 'pg'
class Bookmark
	attr_reader :id, :title, :url
	def initialize(id:, url:, title:)
		@id = id
		@title = title
		@url = url 
	end
	def self.all
		if ENV['ENVIRONMENT'] == 'test'
      		connection = PG.connect(dbname: 'bookmark_manager_test')
      	else
      		connection = PG.connect(dbname: 'bookmark_manager')
      	end
      	result = connection.exec('SELECT * from bookmarks')
      	result.map do |bookmark|
      		Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])
      	end
	 end

	 def self.create(url:, title:)
	 	if ENV['ENVIRONMENT'] == 'test'
      		connection = PG.connect(dbname: 'bookmark_manager_test')
      	else
      		connection = PG.connect(dbname: 'bookmark_manager')
      	end
      	result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
      	Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	 end
end