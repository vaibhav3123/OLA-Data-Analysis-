# 🚖 Ola Ride Analysis using SQL & Power BI

## 📌 Project Overview  
Ride-hailing services like Ola generate vast amounts of data daily. Analyzing this data helps uncover trends in customer behavior, ride patterns, cancellations, and payment preferences. This project utilizes **SQL** for data extraction and analysis, while **Power BI** is used for interactive data visualization. The goal is to derive actionable insights that can enhance operational efficiency and customer experience.

### **Objectives:**  
- Analyze ride booking patterns and trends  
- Identify frequent cancellations and their reasons  
- Examine ride distances and vehicle type preferences  
- Evaluate payment trends across different user groups  
- Visualize insights using Power BI for better decision-making  

---

## 🗃 Dataset Details  
The dataset comprises **100,000 ride records** from Ola's ride-hailing service, covering multiple aspects such as trip details, customer preferences, and payment behavior.

- **Total Records:** 100,000  
- **Columns in the Dataset:**  
  - `Date` – Date of the ride  
  - `Time` – Time of the ride  
  - `Booking_ID` – Unique identifier for each ride (Primary Key)  
  - `Booking_Status` – Status of the booking  
  - `Customer_ID` – Unique identifier for customers  
  - `Vehicle_Type` – Type of vehicle used for the ride  
  - `Pickup_Location` – Ride start point  
  - `Drop_Location` – Ride end point  
  - `V_TAT` – Vehicle Turnaround Time  
  - `C_TAT` – Customer Turnaround Time  
  - `Canceled_Rides_by_Customer` – Number of cancellations by the customer  
  - `Canceled_Rides_by_Driver` – Number of cancellations by the driver  
  - `Incomplete_Rides` – Number of incomplete rides  
  - `Incomplete_Rides_Reason` – Reasons for incomplete rides  
  - `Booking_Value` – Total fare amount for the ride  
  - `Payment_Method` – Mode of payment used  
  - `Ride_Distance` – Distance traveled per ride  
  - `Driver_Ratings` – Driver rating for the ride  
  - `Customer_Rating` – Customer rating for the ride  
  - `Vehicle_Images` – Image data of the vehicle (if available)  

---

## 🛠 SQL Analysis  

### 🔹 Retrieve All Successful Bookings  
```sql
CREATE VIEW Successful_Bookings AS
SELECT * FROM Ola_Rides
WHERE Booking_Status = 'Success';
```

### 🔹 Find the Average Ride Distance for Each Vehicle Type  
```sql
CREATE VIEW Ride_Distance_For_Each_Vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM Ola_Rides
GROUP BY Vehicle_Type;
```

### 🔹 List the Top 5 Customers Who Booked the Highest Number of Rides  
```sql
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM Ola_Rides
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;
```

### 🔹 Get the Number of Rides Cancelled by Drivers Due to Personal and Car-Related Issues  
```sql
CREATE VIEW Rides_Cancelled_By_Drivers_P_C_Issues AS
SELECT COUNT(*) FROM Ola_Rides
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
```

### 🔹 Find the Maximum and Minimum Driver Ratings for Prime Sedan Bookings  
```sql
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS max_rating,
       MIN(Driver_Ratings) AS min_rating
FROM Ola_Rides 
WHERE Vehicle_Type = 'Prime Sedan';
```

### 🔹 Retrieve All Rides Where Payment Was Made Using UPI  
```sql
CREATE VIEW UPI_Payment AS
SELECT * FROM Ola_Rides
WHERE Payment_Method = 'UPI';
```

### 🔹 Find the Average Customer Rating Per Vehicle Type  
```sql
CREATE VIEW AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM Ola_Rides
GROUP BY Vehicle_Type;
```

### 🔹 Calculate the Total Booking Value of Rides Completed Successfully  
```sql
CREATE VIEW Total_Successful_Ride_Value AS
SELECT SUM(Booking_Value) AS total_successful_ride_value
FROM Ola_Rides
WHERE Booking_Status = 'Success';
```

### 🔹 List All Incomplete Rides Along with the Reason  
```sql
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Ola_Rides
WHERE Incomplete_Rides = 'Yes';
```

---

## 📊 Power BI Dashboard  

### **Power BI Implementation**  
Power BI was used to create interactive and dynamic visualizations that provide deep insights into ride patterns. The dashboard includes key metrics and visual reports covering:
- **Booking Trends** – Analysis of ride demand over different time periods  
- **Cancellation Rates** – Breakdown of cancellation reasons and patterns  
- **Ride Distance Distribution** – Insights into trip lengths and vehicle type preferences  
- **Payment Trends** – Popular payment methods among users  
- **Customer Ratings** – Trends in customer satisfaction levels  


## 📌 Connect with Me  
👤 **Vaibhav Bari**  
📧 **bariv219@gmail.com**  
🔗 [LinkedIn] www.linkedin.com/in/
vaibhav-bari-915bb5202
