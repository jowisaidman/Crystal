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
  column awards : String?
  column poster : String?
  column raitings : String?
  column box_office : String?
  column production : String?
  column userid : Int32?
  timestamps
end
