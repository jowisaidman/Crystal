h1 Show Movie
p = movie.title
p = movie.year
p = movie.rated
p = movie.realeased
p = movie.runtime
p = movie.genre
p = movie.director
p = movie.writer
p = movie.actors
p = movie.plot
p = movie.language
p = movie.country
p = movie.awards
p = movie.poster
p = movie.raitings
p = movie.metascore
p = movie.imdb_rating
p = movie.imdb_votes
p = movie.imdb_id
p = movie.type
p = movie.dvd
p = movie.box_office
p = movie.production
p = movie.website
p = movie.response
p
  == link_to("Back", "/movies", class: "btn btn-light btn-sm")
  == link_to("Edit", "/movies/#{movie.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/movies/#{movie.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
