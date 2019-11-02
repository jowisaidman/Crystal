-- +micrate Up
CREATE TABLE movies (
  id BIGSERIAL PRIMARY KEY,
  title VARCHAR,
  year VARCHAR,
  rated VARCHAR,
  realeased VARCHAR,
  runtime VARCHAR,
  genre VARCHAR,
  director VARCHAR,
  writer VARCHAR,
  actors VARCHAR,
  plot VARCHAR,
  language VARCHAR,
  country VARCHAR,
  awards VARCHAR,
  poster VARCHAR,
  raitings VARCHAR,
  metascore VARCHAR,
  imdb_rating VARCHAR,
  imdb_votes VARCHAR,
  imdb_id VARCHAR,
  type VARCHAR,
  dvd VARCHAR,
  box_office VARCHAR,
  production VARCHAR,
  website VARCHAR,
  response VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS movies;
