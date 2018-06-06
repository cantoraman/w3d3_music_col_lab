require('pg')
require_relative('../db/sql_runner')
require_relative('artist')


class Album

attr_accessor :title, :genre
attr_reader :id


def initialize (options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @id = options['id'].to_i if options['id']
end


def save()
  sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
  values = [@title, @genre, @artist_id]
  result = SqlRunner.run(sql, values)
  @id = result[0]["id"].to_i
end

def self.delete_all
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
end

def self.list_all
  sql = "SELECT * FROM albums"
  results_pg=SqlRunner.run(sql)
  results_array = results_pg.map{|result| Album.new(result)}
  return results_array
end

def self.list_all_by_artist(name)
  artist_id=Album.artist_name_to_id(name)
  sql = "SELECT * FROM albums WHERE artist_id = ($1)"
  values = [artist_id]
  results_pg=SqlRunner.run(sql, values)
  results_array = results_pg.map{|result| Album.new(result)}
end

def self.artist_name_to_id(name)
  sql = "SELECT * FROM artists WHERE name = ($1)"
  values = [name]
  results_pg=SqlRunner.run(sql, values)
  return results_pg[0]['id'].to_i
end

end




#
