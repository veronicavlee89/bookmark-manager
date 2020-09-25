require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'takes one parameter of database name' do
      expect(DatabaseConnection).to respond_to(:setup).with(1).argument
    end

    it 'sets up a database connection using PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test').once

      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  it 'persists the connection' do
    connection = DatabaseConnection.setup('bookmark_manager_test')

    expect(DatabaseConnection.connection).to eq connection
  end

  describe '.query' do
    it 'takes one parameter of a database query' do
      expect(DatabaseConnection).to respond_to(:query).with(1).argument
    end

    it 'executes the query using PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end