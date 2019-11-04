.col-md-11
    h1 Favoritos
    br
  - movies.each do |movie|  
      a href="/movies/#{movie.id}"
        img src=movie.poster height="300" width="200"
- if !movies.exists?
  p = "No tienes peliculas favoritas"