select * from Sales;

-- Flitering data by where clause
select Customer_Name,Segment,Country from Sales where Country='Germany';

-- sorting data by sales in descending 
select Customer_Name,Category,Sales from Sales order by Sales desc; 

-- sum of sales to each region
select region, sum(sales) as total_sales from Sales group by region;

-- Top 3 Orders with Highest Profit
select top 3 Order_ID,Customer_Name,Product_Name,Sales,Profit from Sales order by Profit desc;

-- second highest sales
select top 1 Customer_Name, Sales from Sales where Sales<(select max(sales) from Sales) order by Sales desc;

--maximum profit for each customer
select Customer_Name,max(profit) as max_profit from Sales group by customer_name ;

-- sum of sales to each region that having above 500000
select Region,sum(Sales) as total_sales from Sales group by Region having sum(Sales) > 500000;

--Rank() function
-- TOP PRODUCTS BY SALES
select product_Name,Sales,rank() over(order by Sales desc) as ranking from Sales;

--Dense rank()
select product_Name,Sales,dense_rank() over(order by Sales desc) as ranking from Sales;

--Row_Number()
select product_Name,Sales,row_number() over(order by Sales desc) as ranking from Sales;

--SUM sales within each region
select Customer_Name,product_name,sales,profit,sum(sales) over(partition by region) as  sum_sales from Sales;

-- customer names starting with 'a'
select customer_name,category, sub_category from Sales where customer_name like'a%';

--maximum profit in each sub_category
select sub_category,max(profit) as max_profit from Sales group by Sub_Category;

--Category Wise Total Sales Analysis
select Category,sum(Sales) as total_sales from Sales group by Category order by total_sales desc;

--Category and Sub-Category Distribution by Region
select Category, sub_category ,region from Sales where region in('West','central');