class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def category_ids=(ids)
    ids.each do |id|
      post = Post.find(id)
      self.posts << post
    end
  end

  def note_contents=(notes)
    notes.each do |content|
      if content != ""
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    if self.genre.name
      self.genre.name
    end
  end
end
