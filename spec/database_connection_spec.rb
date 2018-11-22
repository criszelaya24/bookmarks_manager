require 'database_connection'

describe DatabaseConnection do
	describe '.setup' do
		it 'sets up a connection to a database through PG' do
			expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

			DatabaseConnection.setup('bookmark_manager_test')
		end

		it 'This connection is persistent' do
			connection = DatabaseConnection.setup('bookmark_manager_test')
			expect(DatabaseConnection.connection).to eq connection
		end
	end

	describe '.query' do
		it 'execute via pg' do
			connection = DatabaseConnection.setup('bookmark_manager_test')
			expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
			DatabaseConnection.query("SELECT * FROM bookmarks;")
		end
	end
end