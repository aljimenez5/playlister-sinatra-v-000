class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
  
  def slug 
    self.name.downcase.gsub(/\W/, '-')
  end
  
  def self.find_by_slug(slug)
    do_not_cap = ["a", "they", "with", "the", "for", "in", "of", "that"]
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