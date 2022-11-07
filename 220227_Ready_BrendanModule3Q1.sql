DROP TABLE IF EXISTS my_query;

CREATE TABLE "my_query" (
"show_id" INTEGER,
"title" TEXT,
"rating" TEXT,
"listed_in" TEXT,
"release_year" INTEGER

);
INSERT INTO my_query 
SELECT movies_info_1.show_id, movies_info_1.title, movies_info_2.rating, movies_info_1.listed_in, movies_info_2.release_year 
FROM movies_info_1 INNER JOIN movies_info_2 ON (movies_info_1.show_id = movies_info_2.show_id);