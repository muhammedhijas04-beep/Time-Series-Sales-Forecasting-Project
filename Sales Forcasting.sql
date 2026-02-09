CREATE DATABASE reatile_sales;

use reatile_sales;


Create table cleaned_data(
    Store INT,
    Dept INT,
    Date DATE,
    Weekly_Sales FLOAT,
    IsHoliday text,
    Type VARCHAR(5),
    Size INT,
    Temperature FLOAT,
    Fuel_Price FLOAT,
    MarkDown1 FLOAT,
    MarkDown2 FLOAT,
    MarkDown3 FLOAT,
    MarkDown4 FLOAT,
    MarkDown5 FLOAT,
    CPI FLOAT,
    Unemployment FLOAT
);



SET GLOBAL LOCAL_INFILE=ON; -- easy way to import large data
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_data.csv'
INTO TABLE cleaned_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SHOW VARIABLES LIKE 'secure_file_priv'; -- will show whuch path is scured to import file 

select *from cleaned_data;





-- #>>>>#  BUSINESS ANALYSIS USING SQL
#----------------------------------------------#

# 1. Overall Weekly Sales Trend

#> How does total company revenue change over time?

select date,
           sum(Weekly_Sales) as total_Weekly_Sales
from cleaned_data
group by date
order by date;

#> 2. Monthly Seasonality

#> which month avg revenue ?

select Month(date) as Month,
       Avg(Weekly_sales) as avg_Monthly_sales
from cleaned_data
group by Month(date)
order by avg_Monthly_sales desc;

#> 3. Holiday Impact

#> show which day has avg sale during holidays or normal days ?

select IsHoliday,
           avg(Weekly_Sales) as avg_weekly_sales
from cleaned_data
group by IsHoliday;

select IsHoliday,
           avg(Weekly_Sales) as avg_weekly_sales
from cleaned_data
where IsHoliday = "True";


#> 4. Sales by Store Type
#> Which type of store performs best?

select Type,
          sum(Weekly_Sales) as total_Weekly_Sales,
          avg(Weekly_Sales) as avg_sale_per_record
from cleaned_data
group by Type
order by total_Weekly_Sales desc;

#> 5. top 10 stores byt revenue

select Store,
	   sum(Weekly_Sales) as total_sales_revenue 
from cleaned_data
group by Store
order by total_sales_revenue Desc
limit 10 ; 

#> 6. Bottom 10 

select Store,
       sum(Weekly_Sales) as total_weekly_sales 
from cleaned_data 
group by Store
order by total_weekly_sales asc
limit 10;

#> 7. Best performing Department

select Dept,
        sum(Weekly_Sales) as total_sales
from cleaned_data 
group by Dept
order by total_sales desc
limit 5;

#> 8. 8️⃣ Store Size vs Sales

select Size,
       AVG(Weekly_Sales) as avg_sales
from cleaned_data
group by Size
order by avg_sales desc;

#> 9. Yearly Sales Growth

select year(date) as Year,
       sum(Weekly_Sales) as total_sales 
from cleaned_data
group by Year
order by total_sales Desc;


#> 10. Promotion Impact

select 
      case
		when (MarkDown1 + MarkDown2 + MarkDown3 + MarkDown4  + MarkDown5) > 0
		then 'Promotion Week'
		else 'no promotion'
	 end as promotio_flag,
	 avg(Weekly_Sales) as avg_sales 
from cleaned_data
group by promotio_flag;



















