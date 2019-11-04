h2 = "Ingrese la pelicula"
== form(action: "/movies/#{movie.id.to_s}", method: movie.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", value: movie.title, placeholder: "Pelicula", class: "form-control")
  == submit("Buscar", class: "btn btn-success btn-sm")