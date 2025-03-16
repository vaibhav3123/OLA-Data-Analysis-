--1. Retrieve all successful bookings:

Create View Successful_Bookings As
SELECT * FROM Ola_rides
WHERE Booking_Status = 'Success';

Select * From Successful_Bookings;

--2. Find the average ride distance for each vehicle type:

Create View ride_distance_for_each_vehicle As 
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance 
FROM Ola_rides
GROUP BY Vehicle_Type;

Select * from ride_distance_for_each_vehicle;

--3. Get the total number of cancelled rides by customers:

Create View cancelled_rides_by_customerss As
SELECT COUNT(*) FROM Ola_rides
WHERE Booking_Status = 'canceled by Customer';

Select * from cancelled_rides_by_customerss;


--4. List the top 5 customers who booked the highest number of rides:

Create View Top_5_Customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM Ola_rides
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM Top_5_Customers;


--5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM Ola_rides
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Rides_cancelled_by_Drivers_P_C_Issues;


--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM Ola_rides 
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM Max_Min_Driver_Rating;


--7. Retrieve all rides where payment was made using UPI:

Create View UPI_Payment As
SELECT * FROM Ola_rides
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;


--8. Find the average customer rating per vehicle type:


Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM Ola_rides
GROUP BY Vehicle_Type;

SELECT * FROM AVG_Cust_Rating;


--9. Calculate the total booking value of rides completed successfully:


Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM Ola_Rides
WHERE Booking_Status = 'Success';

SELECT * FROM total_successful_ride_value;


--10. List all incomplete rides along with the reason:


Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Ola_Rides
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM Incomplete_Rides_Reason;
