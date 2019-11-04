.row
  .col-sm-11
    h1 Movies
== render(partial: "movie/_form_search.slang")

- if new_movie.title
  .row
    .col-md-12
      .col-md-4
        p = "Titulo: #{new_movie.title}" 
        img src=new_movie.poster height="150" width="150" float="left"
        p
          span
            == link_to("Like", "/movies/fav/#{movie.title}", class: "btn btn-info btn-sm")
- if error
  .row
    .col-md-12
      .col-md-4  
        p = "No se encontro una pelicula con ese nombre"