class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
  
  def slug 
    self.name.downcase.gsub(/\W/, '_')
  end
  
  def self.find_by_slug(slug)
    unslugged = []
    self.all.map do |obj| 
      binding.pry
      if obj.name.include?(slug.split('_').join(' '))
        
        unslugged << obj
        
      end
    end
   
    self.find_by_name(unslugged.first.name)
    
  end
  
end