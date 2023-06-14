/*The owner of a DVD rental store is curious to know which dates in May and June 2005 had the most rentals. Write a query to generate a list of dates between May 24th and June 2nd (inclusive), 2005 and counts the number of rentals on each date. The query should return a result set with two columns: date and rentals. The date column should be formatted as 'YYYY-MM-DD'. The rentals column should contain the number of rentals that occurred on that date.

Notes:
If there are no rentals, you need to display 0 for that day, not to avoid that day
The result set should be sorted by date in ascending order
for the sample tests, static dump of DVD Rental Sample Database is used, for the final solution - random tests.
Schema
rental table:
Column       | Type      | Modifiers
-------------+-----------+----------
rental_id    | integer   | not null
customer_id  | integer   | not null
inventory_id | integer   | not null
rental_date  | timestamp | not null
return_date  | timestamp | 
Desired Output
The desired output should look like this:

date         |  rentals
-------------+---------------+
2005-05-24   | 38            |
2005-05-25   | 29            | */

SELECT TO_CHAR(dates.date, 'YYYY-MM-DD') AS date,
       COALESCE(COUNT(rental_id), 0) AS rentals
FROM (
  SELECT generate_series('2005-05-24'::date, '2005-06-02'::date, '1 day'::interval) AS date
    ) AS dates
LEFT JOIN rental ON TO_CHAR(rental_date, 'YYYY-MM-DD') = TO_CHAR(date, 'YYYY-MM-DD')
GROUP BY date
ORDER BY date ASC;

/* W tym zapytaniu tworzymy pomocniczą tabelę dates za pomocą funkcji generate_series, która generuje listę dat między '2005-05-24' a '2005-06-02'. Następnie wykonujemy lewe połączenie (left join) z tabelą rental na podstawie daty, aby uwzględnić wszystkie daty, nawet jeśli nie ma dla nich żadnych wynajęć. Wartości rentals, które nie mają pasującego wynajęcia, zostaną zastąpione zerem za pomocą funkcji COALESCE.
*/