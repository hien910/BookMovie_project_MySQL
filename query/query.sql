-- 1. Tổng thu nhập 
select sum(amount) from Payments;

-- 2 Lấy thông tin chi tiết về đơn đặt vé(tên khách hàng, tên phim, rạp) sắp xếp theo thời gian đặt vé từ muộn đến gần đây
select Bookings.*, Customers.customerName,Movies.title, Theaters.theaterName ,Theaters.location from Bookings
inner join Showtimes on Bookings.showtimeID = Showtimes.showtimeID
inner join Movies on Showtimes.movieID = Movies.movieID
inner join Theaters on Showtimes.theaterID =  Theaters.theaterID
inner join Customers on Bookings.customerID = Customers.customerID
order by bookingDate ASC;

-- 3. lấy thông tin khách hàng đặt vé, sắp xếp theo số lượng giảm dần
select count(Bookings.customerID) as num_of_bookings, Customers.* from Bookings
inner join Customers on Bookings.customerID = Customers.customerID
group by customerID
order by count(Customers.customerID) DESC;

-- 4. lấy thông tin order thêm itemName và tổng giá phải trả 
select Order_Item.* , Items.itemName, Items.itemPrice, sum(Items.itemPrice * Order_Item.quantityItem) as total_price
from Order_Item
inner join Bookings on Order_Item.bookingID = Bookings.bookingID
inner join Items on  Order_Item.itemID = Items.itemID
group by Order_Item.order_item_ID
order by total_price DESC;

-- 5 Lấy thông tin bộ phim được đánh giá từ cao đến thấp và lấy tên khách hàng đánh giá?
select Evaluations.* , Customers.customerName, Movies.title from Evaluations
inner join Bookings on Evaluations.bookingID = Bookings.bookingID
inner join Customers on Bookings.customerID = Customers.customerID
inner join Showtimes on Bookings.showtimeID = Showtimes.showtimeID
inner join Movies on Showtimes.movieID = Movies.movieID
order by point DESC;


-- 6 Bộ phim nào được chiếu nhiều nhất
CREATE VIEW NumOfShowMovie
AS
select  count(Bookings.showtimeID) as num , Movies.movieID from Bookings 
inner join Showtimes on Bookings.showtimeID = Showtimes.showtimeID
inner join Movies on Showtimes.movieID =  Movies.movieID
group by Bookings.showtimeID
order by num DESC ;
select sum(num) as sum ,movieID from NumOfShowMovie
group by movieID
order by sum(num) DESC;




