class Movie < Granite::Base
  connection pg
  table movies

  column id : Int64, primary: true
  column title : String?
  column year : String?
  column rated : String?
  column realeased : String?
  column runtime : String?
  column genre : String?
  column director : String?
  column writer : String?
  column actors : String?
  column plot : String?
  column language : String?
  column country : String?
  column awards : String?
  column poster : String?
  column raitings : String?
  column metascore : String?
  column imdb_rating : String?
  column imdb_votes : String?
  column imdb_id : String?
  column type : String?
  column dvd : String?
  column box_office : String?
  column production : String?
  column website : String?
  column response : String?
  timestamps
end
