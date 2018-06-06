require ('pry')
require_relative('../models/album')
require_relative('../models/artist')

Artist.delete_all()

artist1 = Artist.new({'name'=>"The Beatles"})
artist2 = Artist.new({'name'=>"Rolling Stones"})
artist1.save()
artist2.save()


  album1 = Album.new({
  'title' => "White Album",
   'genre' => "rock",
   'artist_id' => artist1.id
   })

  def create_artist(name)
     artist_3 = Artist.new({'name' => name})
     artist_3.save()
  end





binding.pry
nil

#
# Music Collection
# You have been asked to create an app that will allow a music collector to manage their collection of CDs/records.
#
# In their console they would like to be able to:
#
# Create and Save Artists
# Create and Save Albums
# List All Artists/Albums
# List all the albums they have by an artist
# Show the artist any album belongs to
# Every artist should have a name, and each album should have a name/title, genre and artist ID.
#
# Further tasks
# Additionally it would be nice to be able to:
#
# Edit Artists/Albums
# Delete Artists/Albums
# Find Artists/Albums by their ID
# Remember to regularly git commit!
