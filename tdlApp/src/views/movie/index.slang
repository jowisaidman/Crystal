.row
  .col-sm-11
    h1 Peliculas
== render(partial: "movie/_form_search.slang")

- if new_movie.title
  br
  .row
    .col-md-12
      .col-md-4
        p = "Titulo: #{new_movie.title}" 
        img src=new_movie.poster height="300" width="200" float="left"
        p
          span
          br
            == link_to("Agregar Favorito", "/movies/fav/#{movie.title}", class: "btn btn-info btn-sm")
- if error
  .row
    .col-md-12
      .col-md-4  
        p = "No se encontro una pelicula con ese nombre"