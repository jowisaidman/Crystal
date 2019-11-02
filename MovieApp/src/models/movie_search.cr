class MovieSearch < Granite::Base
  connection pg
  table movie_searches

  column id : Int64, primary: true
  column title : String?
  timestamps
end
