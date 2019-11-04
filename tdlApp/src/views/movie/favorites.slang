.row
  .col-md-12
    h1 Favorites
  - movies.each do |movie|
    .col-md-4
      p = "Titulo: #{movie.title}" 
      p = "Ano: #{movie.year}"
      p = "Rating: #{movie.rated}"
      p = "Realesed: #{movie.realeased}"
      p = "Duracion #{movie.runtime}"
      p = "Gener: #{movie.genre}"
      p = "Director: #{movie.director}"
      p = "Escritor: #{movie.writer}"
      p = "Actores: #{movie.actors}"
      p = "Descripcion: \n\t #{movie.plot}"
      p = "Premios: #{movie.awards}"
      img src=movie.poster height="150" width="150" float="left"
      p = "Raitings: #{movie.raitings}"
      p = "Costo: #{movie.box_office}"
      p = "Produccion: #{movie.production}"
      == link_to("No Like", "/movies/#{movie.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
- if !movies.exists?
  p = "No tienes peliculas favoritas"