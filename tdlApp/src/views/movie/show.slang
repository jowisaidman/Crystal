h1 Inoformacion
  center
  h4 = "Titulo: #{movie.title}" 
  img src=movie.poster height="300" width="200" float="left"
  br
  p = "Año: #{movie.year}"
  p = "Rating: #{movie.rated}"
  p = "Realesed: #{movie.realeased}"
  p = "Duracion: #{movie.runtime}"
  p = "Gener: #{movie.genre}"
  p = "Director: #{movie.director}"
  p = "Escritor: #{movie.writer}"
  p = "Actores: #{movie.actors}"
  p = "Descripcion: \n\t #{movie.plot}"
  p = "Premios: #{movie.awards}"
  p = "Costo: #{movie.box_office}"
  p = "Produccion: #{movie.production}"
  p
  == link_to("Quitar Favorito", "/movies/#{movie.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Desea quitarlo de favoritos?", class: "btn btn-danger btn-sm")
  == link_to("Volver", "/movies/favorites", class: "btn btn-success btn-sm")