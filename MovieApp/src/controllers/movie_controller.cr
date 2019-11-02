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
    if movie.save
      redirect_to action: :index, flash: {"success" => "Movie has been created."}
    else
      flash[:danger] = "Could not create Movie!"
      render "new.slang"
    end
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
      required :year
      required :rated
      required :realeased
      required :runtime
      required :genre
      required :director
      required :writer
      required :actors
      required :plot
      required :language
      required :country
      required :awards
      required :poster
      required :raitings
      required :metascore
      required :imdb_rating
      required :imdb_votes
      required :imdb_id
      required :type
      required :dvd
      required :box_office
      required :production
      required :website
      required :response
    end
  end

  private def set_movie
    @movie = Movie.find! params[:id]
  end
end
