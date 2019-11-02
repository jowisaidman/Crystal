require "./spec_helper"

def movie_search_hash
  {"title" => "Fake"}
end

def movie_search_params
  params = [] of String
  params << "title=#{movie_search_hash["title"]}"
  params.join("&")
end

def create_movie_search
  model = MovieSearch.new(movie_search_hash)
  model.save
  model
end

class MovieSearchControllerTest < GarnetSpec::Controller::Test
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

describe MovieSearchControllerTest do
  subject = MovieSearchControllerTest.new

  it "renders movie_search index template" do
    MovieSearch.clear
    response = subject.get "/movie_searches"

    response.status_code.should eq(200)
    response.body.should contain("movie_searches")
  end

  it "renders movie_search show template" do
    MovieSearch.clear
    model = create_movie_search
    location = "/movie_searches/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Movie Search")
  end

  it "renders movie_search new template" do
    MovieSearch.clear
    location = "/movie_searches/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Movie Search")
  end

  it "renders movie_search edit template" do
    MovieSearch.clear
    model = create_movie_search
    location = "/movie_searches/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Movie Search")
  end

  it "creates a movie_search" do
    MovieSearch.clear
    response = subject.post "/movie_searches", body: movie_search_params

    response.headers["Location"].should eq "/movie_searches"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a movie_search" do
    MovieSearch.clear
    model = create_movie_search
    response = subject.patch "/movie_searches/#{model.id}", body: movie_search_params

    response.headers["Location"].should eq "/movie_searches"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a movie_search" do
    MovieSearch.clear
    model = create_movie_search
    response = subject.delete "/movie_searches/#{model.id}"

    response.headers["Location"].should eq "/movie_searches"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
