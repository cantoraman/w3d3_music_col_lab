require('pg')
require_relative('../db/sql_runner')
#require_relative('album')


class Artist

attr_accessor :name
attr_reader :id


def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
end



def save()
  sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
  values = [@name]
  result = SqlRunner.run(sql, values)
  @id = result[0]["id"].to_i
end

def self.delete_all
  sql = "DELETE FROM artists"
  SqlRunner.run(sql)
end


def self.list_all
  sql = "SELECT * FROM artists"
  results_pg=SqlRunner.run(sql)
  results_array = results_pg.map{|result| Artist.new(result)}
  return results_array
end





end












#
