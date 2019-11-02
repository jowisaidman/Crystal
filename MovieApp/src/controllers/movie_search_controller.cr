require "http/client"
require "oauth"
require "json"

class MovieSearchController < ApplicationController
  getter movie_search = MovieSearch.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_movie_search }
  end

  def index
    movie_searches = MovieSearch.all
    render "index.slang"
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
    movie_search = MovieSearch.new movie_search_params.validate! #rompe si ingreso vacio
    token = "some_token"
    secret = "ad8574dd"
    consumer_key = "some_consumer_key"
    consumer_secret = "some_consumer_secret"
    
    # Create an HTTP::Client as usual
    client = HTTP::Client.new("www.omdbapi.com", tls: true)
    
    # Prepare it for using OAuth authentication
    OAuth.authenticate(client, token, secret, consumer_key, consumer_secret)
    
    # Execute requests as usual: they will be authenticated
    request = "http://www.omdbapi.com/?t="+movie_search.title!+"&apikey=ad8574dd"
    request = request.tr(" ","+")
    response = client.get(request)

    var_j = JSON.parse response.body
    if var_j["Response"] != "False"
      movie_search.title = var_j["Poster"].as_s?
      add_new_movie(var_j)
    end
    render "index.slang"
  end

  def add_new_movie(data)
    movie = Movie.new
    movie.title = data["Title"].as_s?
    movie.poster = data["Poster"].as_s?
    movie.year = data["Year"].as_s?
    movie.rated = data["Rated"].as_s?
    movie.save
  end

  def update
    movie_search.set_attributes movie_search_params.validate!
    if movie_search.save
      redirect_to action: :index, flash: {"success" => "Movie_search has been updated."}
    else
      flash[:danger] = "Could not update MovieSearch!"
      render "edit.slang"
    end
  end

  def destroy
    movie_search.destroy
    redirect_to action: :index, flash: {"success" => "Movie_search has been deleted."}
  end

  private def movie_search_params
    params.validation do
      required :title
    end
  end

  private def set_movie_search
    @movie_search = MovieSearch.find! params[:id]
  end
end
