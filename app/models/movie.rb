require 'open-uri'

class Movie < ActiveRecord::Base
  
  private
  
  def self.in_theaters
    url = "http://www.imdb.com/movies-in-theaters/"
    data = Nokogiri::HTML(open(url).read)
    
    movies = data.css('.list_item')
    movies_formatted = []
    
    movies.each do |movie| 
      
      parts = movie.css('h4').text.split /(\(\d{4}\))/
      
      title = parts[0]
      year = parts[1].gsub!(/[()]/, '')
      description = movie.css('.outline').text
      metascore = movie.css('.metascore strong').text
    
      movies_formatted << Movie.new(title: parts[0], year: parts[1], description: description, metascore: metascore)
    end  
    
    movies_formatted
  end
  
  def self.upcoming
    
  end
end
