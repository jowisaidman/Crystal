- if movie.errors
  ul.errors
    - movie.errors.each do |error|
      li = error.to_s

== form(action: "/movies/#{movie.id.to_s}", method: movie.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", value: movie.title, placeholder: "Pelicula", class: "form-control")
  == submit("Buscar", class: "btn btn-success btn-sm")
  == link_to("Atras", "/", class: "btn btn-light btn-sm")