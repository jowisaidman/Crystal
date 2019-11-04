require "http/client"
require "oauth"
require "json"

class MovieController < ApplicationController
  getter movie = Movie.new

  before_action do
    only [:show, :edit, :destroy] { set_movie }
  end

  def index
    error = false
    new_movie = Movie.new
    render "index.slang"
  end

  def favorites
    user = current_user ? current_user : nil
    id = 0
    if (user) 
      id = user.id
    end
    movies = Movie.where(userid: id)
    render "favorites.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    error = false
    movie = Movie.new movie_params.validate!
    new_movie = get_movie movie
    if !new_movie.title
      error = true
    end
    render "index.slang"
  end

  private def get_movie(old_movie : Movie)
    movie = Movie.new
    token = "some_token"
    secret = "ad8574dd"
    consumer_key = "some_consumer_key"
    consumer_secret = "some_consumer_secret"
    
    # Create an HTTP::Client as usual
    client = HTTP::Client.new("www.omdbapi.com", tls: true)
    
    # Prepare it for using OAuth authentication
    OAuth.authenticate(client, token, secret, consumer_key, consumer_secret)
    
    # Execute requests as usual: they will be authenticated
    request = "http://www.omdbapi.com/?t="+old_movie.title!+"&apikey=ad8574dd"
    request = request.tr(" ","+")
    response = client.get(request)
    response.status_code   
    puts(response.body)
    var_j = JSON.parse response.body
    if var_j["Response"] != "False"
      fill_movie_data(var_j,movie)
    end
    return movie
  end

  def fill_movie_data(data,movie)
    movie.title = data["Title"].as_s?
    movie.realeased = data["Released"].as_s?
    movie.runtime = data["Runtime"].as_s?
    movie.year = data["Year"].as_s?
    movie.rated = data["Rated"].as_s?
    movie.genre = data["Genre"].as_s?
    movie.director = data["Director"].as_s?
    movie.writer = data["Writer"].as_s?
    movie.actors = data["Actors"].as_s?
    movie.plot = data["Plot"].as_s?
    movie.awards = data["Awards"].as_s?
    movie.poster = data["Poster"].as_s?
    movie.box_office = data["BoxOffice"].as_s?
    movie.production = data["Production"].as_s?
  end

  def update
    movie = Movie.new 
    movie.title = params[:title]
    movie = get_movie movie
    user = current_user ? current_user : nil
    id = 0
    if (user) 
      temp = user.id
      if temp 
        id = temp
      end 
    end
    movie.userid = id.to_i
    movie.save
    redirect_to action: :favorites
  end

  def destroy
    movie.destroy
    redirect_to action: :favorites, flash: {"success" => "La pelicula a sido removida de favoritos."}
  end

  private def movie_params
    params.validation do
      required :title
    end
  end

  private def set_movie
    @movie = Movie.find! params[:id]
  end
end
