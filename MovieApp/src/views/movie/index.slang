.row
  .col-sm-11
    h2 Historial De Busqueda
    br
  .row
    - movies.each do |movie|
      img src=movie.poster
    end