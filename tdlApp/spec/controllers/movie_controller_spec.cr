require "./spec_helper"

def movie_hash
  {"title" => "Fake", "year" => "Fake", "rated" => "Fake", "realeased" => "Fake", "runtime" => "Fake", "genre" => "Fake", "director" => "Fake", "writer" => "Fake", "actors" => "Fake", "plot" => "Fake", "awards" => "Fake", "poster" => "Fake", "raitings" => "Fake", "box_office" => "Fake", "production" => "Fake", "userid" => "1"}
end

def movie_params
  params = [] of String
  params << "title=#{movie_hash["title"]}"
  params << "year=#{movie_hash["year"]}"
  params << "rated=#{movie_hash["rated"]}"
  params << "realeased=#{movie_hash["realeased"]}"
  params << "runtime=#{movie_hash["runtime"]}"
  params << "genre=#{movie_hash["genre"]}"
  params << "director=#{movie_hash["director"]}"
  params << "writer=#{movie_hash["writer"]}"
  params << "actors=#{movie_hash["actors"]}"
  params << "plot=#{movie_hash["plot"]}"
  params << "awards=#{movie_hash["awards"]}"
  params << "poster=#{movie_hash["poster"]}"
  params << "raitings=#{movie_hash["raitings"]}"
  params << "box_office=#{movie_hash["box_office"]}"
  params << "production=#{movie_hash["production"]}"
  params << "userid=#{movie_hash["userid"]}"
  params.join("&")
end

def create_movie
  model = Movie.new(movie_hash)
  model.save
  model
end

class MovieControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe MovieControllerTest do
  subject = MovieControllerTest.new

  it "renders movie index template" do
    Movie.clear
    response = subject.get "/movies"

    response.status_code.should eq(200)
    response.body.should contain("movies")
  end

  it "renders movie show template" do
    Movie.clear
    model = create_movie
    location = "/movies/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Movie")
  end

  it "renders movie new template" do
    Movie.clear
    location = "/movies/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Movie")
  end

  it "renders movie edit template" do
    Movie.clear
    model = create_movie
    location = "/movies/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Movie")
  end

  it "creates a movie" do
    Movie.clear
    response = subject.post "/movies", body: movie_params

    response.headers["Location"].should eq "/movies"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a movie" do
    Movie.clear
    model = create_movie
    response = subject.patch "/movies/#{model.id}", body: movie_params

    response.headers["Location"].should eq "/movies"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a movie" do
    Movie.clear
    model = create_movie
    response = subject.delete "/movies/#{model.id}"

    response.headers["Location"].should eq "/movies"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
