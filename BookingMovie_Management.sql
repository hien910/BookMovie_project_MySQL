create table  Customers(
customerID int primary key auto_increment,
customerName text,
gender varchar(50),
phone varchar(15),
birthday date );

create table Movies(
movieID int primary key auto_increment,
title text,
releaseDate date);

create table Genres(
genreID int primary key auto_increment,
genre text);
 
create table Movie_Genre(
genreID int ,
movieID int,
primary key (genreID, movieID),
foreign key (genreID) references Genres(genreID),
foreign key (movieID) references Movies(movieID) );



CREATE TABLE Theaters (
    theaterID INT PRIMARY KEY auto_increment,
    theaterName text,
    location text,
    totalSeat int
);

CREATE TABLE Showtimes (
    showtimeID INT PRIMARY KEY auto_increment,
    movieID INT,
    theaterID INT,
    dateShow date,
    timeStart TIME,
    timeEnd time,
    FOREIGN KEY (movieID) REFERENCES Movies(movieID),
    FOREIGN KEY (theaterID) REFERENCES Theaters(theaterID)
);

CREATE TABLE Bookings (
    bookingID INT PRIMARY KEY auto_increment ,
    customerID INT,
    showtimeID INT,
    seatNumber INT,
    bookingDate DATE,
    bookingTime time,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID),
    FOREIGN KEY (showtimeID) REFERENCES Showtimes(showtimeID)
);

CREATE TABLE Items (
    itemID INT PRIMARY KEY auto_increment ,
    itemName text,
    itemPrice int
);

create table Order_Item(
order_item_ID int primary key auto_increment,
bookingID int,
FOREIGN KEY (bookingID) REFERENCES Bookings(bookingID),
itemID int,
FOREIGN KEY (itemID) REFERENCES Items(itemID),
quantityItem int
);

CREATE TABLE Payments (
    paymentID INT PRIMARY KEY auto_increment,
    bookingID INT unique ,
    amount int,
    paymentDate DATETIME,
    FOREIGN KEY (bookingID) REFERENCES Bookings(bookingID)
);
CREATE TABLE Evaluations (
    evaluationID INT PRIMARY KEY auto_increment,
    bookingID INT unique ,
    point int,
    evaluationDate date,
    FOREIGN KEY (bookingID) REFERENCES Bookings(bookingID)
);


 


