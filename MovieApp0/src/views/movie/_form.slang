- if movie.errors
  ul.errors
    - movie.errors.each do |error|
      li = error.to_s

== form(action: "/movies/#{movie.id.to_s}", method: movie.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", value: movie.title, placeholder: "Title", class: "form-control")
  .form-group
    == text_field(name: "year", value: movie.year, placeholder: "Year", class: "form-control")
  .form-group
    == text_field(name: "rated", value: movie.rated, placeholder: "Rated", class: "form-control")
  .form-group
    == text_field(name: "realeased", value: movie.realeased, placeholder: "Realeased", class: "form-control")
  .form-group
    == text_field(name: "runtime", value: movie.runtime, placeholder: "Runtime", class: "form-control")
  .form-group
    == text_field(name: "genre", value: movie.genre, placeholder: "Genre", class: "form-control")
  .form-group
    == text_field(name: "director", value: movie.director, placeholder: "Director", class: "form-control")
  .form-group
    == text_field(name: "writer", value: movie.writer, placeholder: "Writer", class: "form-control")
  .form-group
    == text_field(name: "actors", value: movie.actors, placeholder: "Actors", class: "form-control")
  .form-group
    == text_field(name: "plot", value: movie.plot, placeholder: "Plot", class: "form-control")
  .form-group
    == text_field(name: "language", value: movie.language, placeholder: "Language", class: "form-control")
  .form-group
    == text_field(name: "country", value: movie.country, placeholder: "Country", class: "form-control")
  .form-group
    == text_field(name: "awards", value: movie.awards, placeholder: "Awards", class: "form-control")
  .form-group
    == text_field(name: "poster", value: movie.poster, placeholder: "Poster", class: "form-control")
  .form-group
    == text_field(name: "raitings", value: movie.raitings, placeholder: "Raitings", class: "form-control")
  .form-group
    == text_field(name: "metascore", value: movie.metascore, placeholder: "Metascore", class: "form-control")
  .form-group
    == text_field(name: "imdb_rating", value: movie.imdb_rating, placeholder: "Imdb_rating", class: "form-control")
  .form-group
    == text_field(name: "imdb_votes", value: movie.imdb_votes, placeholder: "Imdb_votes", class: "form-control")
  .form-group
    == text_field(name: "imdb_id", value: movie.imdb_id, placeholder: "Imdb_id", class: "form-control")
  .form-group
    == text_field(name: "type", value: movie.type, placeholder: "Type", class: "form-control")
  .form-group
    == text_field(name: "dvd", value: movie.dvd, placeholder: "Dvd", class: "form-control")
  .form-group
    == text_field(name: "box_office", value: movie.box_office, placeholder: "Box_office", class: "form-control")
  .form-group
    == text_field(name: "production", value: movie.production, placeholder: "Production", class: "form-control")
  .form-group
    == text_field(name: "website", value: movie.website, placeholder: "Website", class: "form-control")
  .form-group
    == text_field(name: "response", value: movie.response, placeholder: "Response", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/movies", class: "btn btn-light btn-sm")
