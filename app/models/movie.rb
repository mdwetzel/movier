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
      director = movie.css('.txt-block span span a').first.text
      imdb_rating = movie.css('.rating-rating').text.to_d
      imdb_url = movie.css('h4 a').first["href"]
      thumbnail = movie.css('img').first["src"]
    
      movies_formatted << Movie.new(title: parts[0], year: parts[1],
                                    description: description, metascore: metascore,
                                    director: director, imdb_rating: imdb_rating,
                                    imdb_url: imdb_url, thumbnail: thumbnail)
    end  
    
    movies_formatted
  end
  
  def self.upcoming
    
  end
end
