use ola;
#Retrieve all successful bookings:

create view Successful_Bookings as
select * from booking where `Booking Status`='Success';

select * from Successful_Bookings;

#Find the average ride distance for each vehicle type:
select `Vehicle Type`, avg(`Ride Distance`) as avg_distance from booking group by `Vehicle Type`

create view avg_distance as
select `Vehicle Type`, avg(`Ride Distance`) as avg_distance from booking group by `Vehicle Type`

select * from avg_distance


#Get the total number of cancelled rides by customers:
select count(*) from booking where `Booking Status` = 'Cancelled by Customer'


 #List the top 5 customers who booked the highest number of rides:
 select `Customer ID`, count(`Booking ID`) as total_rides
 from booking
 group by `Customer ID`
 order by total_rides desc LIMIT 5

 #Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) as Personal_Car_Related_Issues
from booking 
where `Reason for cancelling by Driver` = 'Personal & Car related issues'

 #Find the maximum and minimum driver ratings for Prime Sedan bookings:
 
 select max(`Driver Ratings`) as max_rating,
 min(`Driver Ratings`) as min_rating
 from booking where `Vehicle Type` = 'Prime Sedan'


 #Retrieve all rides where payment was made using UPI:
 select * from booking where payment_method='UPI'

 # Find the average customer rating per vehicle type:
 select `Vehicle Type`, avg(`Customer Rating`) as avg_cust_rating
 from booking
 group by `Vehicle Type`

 # Calculate the total booking value of rides completed successfully
 select sum(`Booking Value`) from booking where `Booking Status` = 'Success'


 # List all incomplete rides along with the reason:
 select `Incomplete Rides`, `Incomplete Rides Reason`
 from booking
 where `Incomplete Rides` >=1