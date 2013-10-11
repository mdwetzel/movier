module MoviesHelper
  def metascore(movie)
    quality = "awesome"
    if movie.metascore > 85 
      quality = "awesome"
    elsif movie.metascore > 70
      quality = "great"
    elsif movie.metascore > 50
      quality = "ok"
    elsif movie.metascore > 30
      quality = "poor"
    else
      quality = "crap"
    end
    
    "<span class='#{quality}'>#{movie.metascore}</span>".html_safe
  end
  
  def imdb_rating(movie)
    if movie.imdb_rating == 0.0
      "No ratings yet"
    else
      movie.imdb_rating
    end
  end
  
  def imdb_url(movie)
    "http://www.imdb.com#{movie.imdb_url}"
  end
end
