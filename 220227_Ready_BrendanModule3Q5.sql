SELECT my_query.listed_in, Count(my_query.listed_in) AS CountOflisted_in
FROM my_query
GROUP BY my_query.listed_in, my_query.rating, my_query.release_year
HAVING (((my_query.rating)="TV-MA") AND ((my_query.release_year)=2019))
ORDER BY Count(my_query.listed_in) DESC , my_query.release_year DESC;