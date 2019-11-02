- if movie_search.errors
  ul.errors
    - movie_search.errors.each do |error|
      li = error.to_s

== form(action: "/movie_searches/#{movie_search.id.to_s}", method: movie_search.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", value: "", placeholder: "Pelicula", class: "form-control")
  == submit("Buscar", class: "btn btn-success btn-sm")
  == link_to("Atras", "/", class: "btn btn-light btn-sm")