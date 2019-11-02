h1 Show Movie Search
p = movie_search.title
p
  == link_to("Back", "/movie_searches", class: "btn btn-light btn-sm")
  == link_to("Edit", "/movie_searches/#{movie_search.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/movie_searches/#{movie_search.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
