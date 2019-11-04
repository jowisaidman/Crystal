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
p = movie.awards
p = movie.poster
p = movie.raitings
p = movie.box_office
p = movie.production
p = movie.userid
p
  == link_to("Back", "/movies", class: "btn btn-light btn-sm")
  == link_to("Edit", "/movies/#{movie.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/movies/#{movie.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
