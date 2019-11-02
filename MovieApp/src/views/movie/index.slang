.row
  .col-sm-11
    h2 Historial De Busqueda
    br
  .row
    - movies.each do |movie|
      a href="/movies/#{movie.id}"
        img alt="Info" src=movie.poster
    end