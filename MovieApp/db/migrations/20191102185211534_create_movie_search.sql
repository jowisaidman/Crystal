-- +micrate Up
CREATE TABLE movie_searches (
  id BIGSERIAL PRIMARY KEY,
  title VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS movie_searches;
