SELECT my_query.listed_in, Count(my_query.listed_in) AS CountOflisted_in FROM my_query 
GROUP BY my_query.listed_in 
ORDER BY Count(my_query.listed_in) DESC;