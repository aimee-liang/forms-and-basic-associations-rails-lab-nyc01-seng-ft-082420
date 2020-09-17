class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # setter and getter methods for genre?
  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name:name)
  end

  # setter and getter for artists?
  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name:name)
  end
  
  # create one for note contents
  def note_contents
    self.notes.map(&:content)
  end

  def note_contents=(contents)
    contents.each do |content|
      if content.respond_to?(:to_s)
        self.notes.build(content:content)
      end
    end
  end

end
