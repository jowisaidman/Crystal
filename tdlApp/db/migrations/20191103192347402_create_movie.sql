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
  awards VARCHAR,
  poster VARCHAR,
  raitings VARCHAR,
  box_office VARCHAR,
  production VARCHAR,
  userid INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS movies;
