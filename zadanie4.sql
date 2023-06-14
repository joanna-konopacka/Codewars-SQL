/*
You are working for a company that wants to reward its top 10 customers with a free gift. You have been asked to generate a simple report that returns the top 10 customers by total amount spent ordered from highest to lowest. Total number of payments has also been requested.

The query should output the following columns:
customer_id [int4]
email [varchar]
payments_count [int]
total_amount [float]
and has the following requirements:
only returns the 10 top customers, ordered by total amount spent from highest to lowest
Database Schema  */

SELECT customer.customer_id AS customer_id, customer.email AS email, COUNT(payment.payment_id) AS payments_count, CAST(SUM(payment.amount) AS FLOAT) AS total_amount
FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.email
ORDER BY total_amount DESC
LIMIT 10;

/*UWAGA: W przypadku sumy wartości liczbowych, takich jak kwota płatności, wartość zwracana jest jako obiekt BigDecimal, a nie typ Float. Test oczekuje wartości liczbowej, która jest równoważna wartości Float. Aby dostosować zapytanie, możemy dodać konwersję wartości sumy na typ Float przy użyciu funkcji CAST. */