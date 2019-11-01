class Movie
    JSON.mapping(
        title: String,
        year: String,
        rated: String,
        realeased: String,
        runtime: String,
        genre: String,
        director: String,
        writer: String,
        actors: String,
        plot: String,
        language: String,
        country: String,
        awards: String,
        poster: String,
        raitings: String,
        metascore: String,
        imdb_rating: String,
        imdb_votes: String,
        imdb_id: String,
        type: String,
        dvd: String,
        box_office: String,
        production: String,
        website: String,
        response: String,
    )
end 

class SearcherController < ApplicationController
end
