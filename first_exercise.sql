/* 
Questions:
1. Write a query that displays InvoiceId, CustomerId and total dollar amount for each invoice, sorted first by CustomerId (in ascending order), and then by total dollar amount  (in descending order).

2. Write a query that displays InvoiceId, CustomerId and total dollar amount for each invoice, but this time sorted first by total dollar amount (in descending order), and then by CustomerId (in ascending order).

3. Compare the results of these two queries above. How are the results different when you switch the column you sort on first? (Explain it in your own words.)

4. Write a query to pull the first 10 rows and all columns from the invoices table that have a dollar amount of total greater than or equal to 10.

5. Write a query to pull the first 5 rows and all columns from the invoices table that have a dollar amount of total less than 10.

6. Find all track names that start with 'B' and end with 's'.

7. Use the invoices table to find all information regarding invoices whose billing address is USA or Germany or Norway or Canada and invoice date is at any point in 2010, sorted from newest to oldest.
*/


/*Question 1*/
select InvoiceId, CustomerId, Total
from invoices
order by CustomerId, Total Desc;
/*Question 2*/
select InvoiceId, CustomerId, Total
from invoices
order by  Total Desc, CustomerId;
/*Question 3*/
/*Between first and second query, which column is sorted first, table  occurs according to first sorting statement. 
After that, it is checking second condition and it is sorting which column is specified according to the first condition. */
/*Question 4*/
select *
from invoices
where total >= 10 
limit 10;
/*Question 5*/
select *
from invoices
where total < 10 
limit 5;
/*Question 6*/
select name
from tracks
where name like 'B%s';
/*Question7*/
select *
from invoices
where BillingCountry in ('USA', 'Germany', 'Norway', 'Canada') and InvoiceDate like '2010%' 
order by InvoiceDate  desc;

       

