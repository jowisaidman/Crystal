require "http/client"
require "oauth"
require "json"

class MovieController < ApplicationController
  getter movie = Movie.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_movie }
  end

  def index
    movies = Movie.all
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
    movie = Movie.new movie_params.validate!
    token = "some_token"
    secret = "ad8574dd"
    consumer_key = "some_consumer_key"
    consumer_secret = "some_consumer_secret"
    
    # Create an HTTP::Client as usual
    client = HTTP::Client.new("www.omdbapi.com", tls: true)
    
    # Prepare it for using OAuth authentication
    OAuth.authenticate(client, token, secret, consumer_key, consumer_secret)
    
    # Execute requests as usual: they will be authenticated
    request = "http://www.omdbapi.com/?t="+movie.title!+"&apikey=ad8574dd"
    request = request.tr(" ","+")
    puts("La request que pide es: ", request)
    response = client.get(request)
    response.status_code   

    var_j = JSON.parse response.body
    puts("##########################################")
    if var_j["Response"] != "False"
      puts("Titulo:", var_j["Title"])
      puts("URL:", var_j["Poster"])
      movie.poster = var_j["Poster"].as_s?
    else 
      puts("Peli no encontrada")
    end
    puts("##########################################")
    render "index.slang"
  end

  def update
    movie.set_attributes movie_params.validate!
    if movie.save
      redirect_to action: :index, flash: {"success" => "Movie has been updated."}
    else
      flash[:danger] = "Could not update Movie!"
      render "edit.slang"
    end
  end

  def destroy
    movie.destroy
    redirect_to action: :index, flash: {"success" => "Movie has been deleted."}
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
