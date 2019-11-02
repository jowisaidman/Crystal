h1 Nueva Busqueda

== render(partial: "movie_search/_form.slang")
br
center
- if movie_search.title
  a href="/movies" 
    img alt="Info" src=movie_search.title
