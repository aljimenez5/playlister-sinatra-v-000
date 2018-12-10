class Genre < ActiveRecord::Base
  has_many :artists, :through => :songs
  has_many :song_genres
  has_many :songs, :through => :song_genres
  
  def slug 
    self.name.downcase.gsub(/\W/, '-')
  end
  
  def self.find_by_slug(slug)
    do_not_cap = ["a", "they", "with", "the"]
    counter = 0
    unslug = ""
    slug.split('_').collect do |word| 
      if counter == 0 || !do_not_cap.include?(word)
        unslug << word.capitalize.join(' ')
      else
        unslug << word
      end
    end
    self.find_by_name(unslug)
  end
  
end