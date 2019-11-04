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
    puts("La request que pide es: ", request)
    response = client.get(request)
    response.status_code   

    var_j = JSON.parse response.body
    puts("##########################################")
    if var_j["Response"] != "False"
      puts("Titulo:", var_j["Title"])
      puts("URL:", var_j["Poster"])
      # movie = fill_movie movie
      movie.title = var_j["Title"].as_s?
      movie.poster = var_j["Poster"].as_s?
    else 
      puts("Peli no encontrada")
    end
    puts("##########################################")
    return movie
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
    redirect_to action: :favorites, flash: {"success" => "Movie has been removed from favorites."}
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
