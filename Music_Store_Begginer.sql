
--[1]--Who is the senior most employee based on job title?---------------------

SELECT TOP (1) title, last_name, first_name 
FROM [dbo].[employee]
ORDER BY title DESC

--------------------------------------------------------------------------------

--[2]--Which countries have the most Invoices?---------------------

Select billing_country, COUNT(*) as count
From [dbo].[invoice]
group by billing_country
Order by count desc

-------------------------------------------------------------------------------
--[3]--What are top 3 values of total invoice?---------------

Select top(3) total
From [dbo].[invoice]
order by total desc

-------------------------------------------------------------------------------
--[4]--Total invoices for every city---------------------------------

Select billing_city, SUM(total) as sum_of_total
From [dbo].[invoice]
group by billing_city
order by sum_of_total desc

-------------------------------------------------------------------------------
--[5]--top 10 customer with the most money spent -------------------------------

Select TOP(10) c.customer_id, c.first_name, c.last_name, c.country, SUM(i.total) AS total_spending
From [dbo].[customer] as c left join [dbo].[invoice] as i
on c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, i.total, c.country 
order by i.total desc

-------------------------------------------------------------------------------