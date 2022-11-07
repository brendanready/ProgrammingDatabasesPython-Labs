SELECT my_query2.country, my_query2.type, Count(my_query2.country) AS countryCount
FROM my_query2
GROUP BY my_query2.country, my_query2.type, my_query2.rating, my_query2.release_year
HAVING (((my_query2.rating)="TV-14") AND ((my_query2.release_year)=2019))
ORDER BY Count(my_query2.country) DESC , my_query2.release_year DESC;