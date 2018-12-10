class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
  
  def slug 
    self.name.split(/\W/).map {|word| word.downcase unless word.empty?}.compact.join(' ')
  end
  
  def self.find_by_slug(slug)
    unslugged = []
    self.all.map do |obj| 
      
      if !!obj.name.downcase.scan(/#{slug.split('_')[0]}/) && !!obj.name.downcase.scan(/#{slug.split('_')[-1]}/)
        unslugged << obj
        
      end
    end
    binding.pry
    self.find_by(unslugged.first.name)
    
  end
  
end