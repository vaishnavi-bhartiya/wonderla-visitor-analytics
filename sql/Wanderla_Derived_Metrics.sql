--1. Revenue by segment (customer type × season)
SELECT Customer_Type, Season,COUNT(*) AS Visits,round(SUM(Total_Revenue_INR),3) AS Revenue,
       round(AVG(Total_Revenue_INR),3) AS Avg_Revenue_Per_Visit
FROM VisitorData
GROUP BY Customer_Type, Season
ORDER BY Revenue DESC;

--2. Campaign effectiveness
SELECT Campaign_Source,COUNT(*) AS Bookings, round(SUM(Total_Revenue_INR),3) AS Revenue,
       round(AVG(Discount_Percent),3) AS Avg_Discount, 
       round(SUM(Total_Revenue_INR)/ COUNT(*),3) AS Revenue_Per_Booking
FROM VisitorData
GROUP BY Campaign_Source
ORDER BY Revenue_Per_Booking DESC;

--3. High-value segment identification 
SELECT Customer_Type,
       round(SUM(Total_Revenue_INR),3) AS Revenue,
       CAST(SUM(Total_Revenue_INR) * 100.0 / SUM(SUM(Total_Revenue_INR)) OVER () AS DECIMAL(5,2)) AS Pct_Of_Total_Revenue
FROM VisitorData
GROUP BY Customer_Type
ORDER BY Revenue DESC;

--4. At-risk customer profile
SELECT At_Risk_Customer,
       round(AVG(Satisfaction_Score),3) AS Avg_Satisfaction,
       round(AVG(Total_Revenue_INR),3) AS Avg_Revenue,
       COUNT(*) AS Customers
FROM VisitorData
GROUP BY At_Risk_Customer;

--5.  Location × booking channel mix
SELECT Park_Location, Booking_Channel, COUNT(*) AS Bookings,
       round(SUM(Total_Revenue_INR),3) AS Revenue
FROM VisitorData
GROUP BY Park_Location, Booking_Channel
ORDER BY Park_Location, Revenue DESC;
