.row
  .col-sm-11
    h2 Movies
  .col-sm-1
    a.btn.btn-success.btn-sm href="/movies/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Title
        th Year
        th Rated
        th Realeased
        th Runtime
        th Genre
        th Director
        th Writer
        th Actors
        th Plot
        th Language
        th Country
        th Awards
        th Poster
        th Raitings
        th Metascore
        th Imdb_rating
        th Imdb_votes
        th Imdb_id
        th Type
        th Dvd
        th Box_office
        th Production
        th Website
        th Response
        th Actions
    tbody
      - movies.each do |movie|
        tr
          td = movie.title
          td = movie.year
          td = movie.rated
          td = movie.realeased
          td = movie.runtime
          td = movie.genre
          td = movie.director
          td = movie.writer
          td = movie.actors
          td = movie.plot
          td = movie.language
          td = movie.country
          td = movie.awards
          td = movie.poster
          td = movie.raitings
          td = movie.metascore
          td = movie.imdb_rating
          td = movie.imdb_votes
          td = movie.imdb_id
          td = movie.type
          td = movie.dvd
          td = movie.box_office
          td = movie.production
          td = movie.website
          td = movie.response
          td
            span
              == link_to("Show", "/movies/#{movie.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/movies/#{movie.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/movies/#{ movie.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
