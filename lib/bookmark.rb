require_relative 'database_connection'
class Bookmark
	attr_reader :id, :title, :url
	def initialize(id:, url:, title:)
		@id = id
		@title = title
		@url = url 
	end
	def self.all
		result = DatabaseConnection.query('SELECT * from bookmarks')
      	result.map do |bookmark|
      		Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])
      	end
	 end

	 def self.create(url:, title:)
	 	result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
      	Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	 end

	 def self.delete(id:)
	 	result = DatabaseConnection.query("DELETE from bookmarks Where id = '#{id}';")
	 end

	 def self.update(id:, url:, title:)
	 	result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
      	Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	 end

	 def self.find(id:)
      	result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
      	Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	 end
end