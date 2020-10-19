
CREATE TABLE Movie
(
movie_ID VARCHAR (5) NOT NULL,
movie_title VARCHAR (20) NOT NULL,
movie_director VARCHAR (20) NOT NULL,
movie_length INT NOT NULL,
movie_genre VARCHAR (15) NOT NULL,
PRIMARY KEY (movie_ID)
);
INSERT INTO Movie (movie_ID,movie_title, movie_director,movie_length,movie_genre)
VALUES('M1','Avengers Endgame','Russo Brothers',181,'Superhero' );
INSERT INTO Movie (movie_ID,movie_title, movie_director,movie_length,movie_genre)
VALUES('M2','Avatar','James Cameron',162,'Sci-Fi' );
INSERT INTO Movie (movie_ID,movie_title, movie_director,movie_length,movie_genre)
VALUES('M3','Titanic','James Cameron',195,'Drama' );
SELECT * FROM Movie;

CREATE TABLE Hall
(
hall_ID VARCHAR (4) NOT NULL,
no_of_seats INT NOT NULL,
hall_name VARCHAR (10) NOT NULL,
PRIMARY KEY (hall_ID)
);
INSERT INTO Hall(hall_ID,no_of_seats,hall_name)
VALUES('H1',8,'Platinum');
INSERT INTO Hall(hall_ID,no_of_seats,hall_name)
VALUES('H2',6,'EXecutive');
INSERT INTO Hall(hall_ID,no_of_seats,hall_name)
VALUES('H3',4,'Royal');
SELECT * FROM Hall;

CREATE TABLE People
(
p_ID VARCHAR (10) NOT NULL,
p_name VARCHAR(20) NOT NULL, 
age INT NOT NULL,
phonenumber VARCHAR (10) NOT NULL,
PRIMARY KEY (p_ID)
);
INSERT INTO People(p_ID,p_name,age,phonenumber)
VALUES('P1','Anu',18,'123456789');
INSERT INTO People(p_ID,p_name,age,phonenumber)
VALUES('P2','Bea',20,'123456789');
INSERT INTO People(p_ID,p_name,age,phonenumber)
VALUES('P3','Cat',19,'123456789');
INSERT INTO People(p_ID,p_name,age,phonenumber)
VALUES('P4','Dill',19,'123456789');
INSERT INTO People(p_ID,p_name,age,phonenumber)
VALUES('P5','Elsa',20,'123456789');
INSERT INTO People(p_ID,p_name,age,phonenumber)
VALUES('P6','Fio',20,'123456789');
SELECT * FROM People;

CREATE TABLE Screening
(
screening_ID VARCHAR(10) NOT NULL,
movie_ID VARCHAR(5) NOT NULL,
hall_ID VARCHAR(4) NOT NULL,
screen_time TIME NOT NULL,
screen_date DATE NOT NULL,
PRIMARY KEY (screening_ID),
FOREIGN KEY (movie_ID) REFERENCES Movie(movie_ID),
FOREIGN KEY (hall_ID) REFERENCES Hall(hall_ID)
);
INSERT INTO Screening (screening_ID,movie_ID,hall_ID,screen_time,screen_date)
VALUES ('SCR1','M1','H3','17:35:00','2020-10-05');
INSERT INTO Screening (screening_ID,movie_ID,hall_ID,screen_time,screen_date)
VALUES ('SCR2','M1','H3','17:35:00','2020-10-06');
INSERT INTO Screening (screening_ID,movie_ID,hall_ID,screen_time,screen_date)
VALUES ('SCR3','M2','H2','17:35:00','2020-10-07');
INSERT INTO Screening (screening_ID,movie_ID,hall_ID,screen_time,screen_date)
VALUES ('SCR4','M3','H1','10:35:00','2020-10-08');
SELECT * FROM Screening;

CREATE TABLE Seat
(
seat_ID VARCHAR(7) NOT NULL,
seat_number INT NOT NULL,
seat_row CHAR(1) NOT NULL,
hall_ID VARCHAR(4) NOT NULL,
PRIMARY KEY (seat_ID),
FOREIGN KEY (hall_ID) REFERENCES Hall(hall_ID)
);
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H1S1',1,'A', 'H1');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H1S2',2,'A', 'H1');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H1S3',1,'B', 'H1');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H1S4',2,'B', 'H1');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H1S5',1,'C', 'H1');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H1S6',2,'C', 'H1');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H1S7',1,'D', 'H1');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H1S8',2,'D', 'H1');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H2S1',1,'A', 'H2');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H2S2',2,'A', 'H2');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H2S3',1,'A', 'H2');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H2S4',2,'B', 'H2');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H2S5',1,'B', 'H2');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H2S6',3,'B', 'H2');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H3S1',1,'R', 'H3');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H3S2',2,'R', 'H3');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H3S3',3,'R', 'H3');
INSERT INTO Seat (seat_ID,seat_number,seat_row, hall_ID)
VALUES('H3S4',4,'R', 'H3');
SELECT * FROM Seat;

CREATE TABLE Booking
(
booking_ID VARCHAR(6) NOT NULL,
price INT NOT NULL,
screening_ID VARCHAR(10) NOT NULL,
p_ID VARCHAR (10) NOT NULL,
PRIMARY KEY (booking_ID),
FOREIGN KEY (screening_ID) REFERENCES Screening(screening_ID),
FOREIGN KEY (p_ID) REFERENCES People(p_ID)
);
INSERT INTO Booking VALUES ('B1',1160,'SCR1','P5');
INSERT INTO Booking VALUES ('B2',1000,'SCR4','P1');
INSERT INTO Booking VALUES ('B3',150,'SCR3','P4');
INSERT INTO Booking VALUES ('B4',120,'SCR2','P2');
INSERT INTO Booking VALUES ('B5',165,'SCR4','P3');
INSERT INTO Booking VALUES ('B6',300,'SCR3','P6');
SELECT * FROM Booking;
CREATE TABLE Seat_Reserved
(
seat_Reserve_ID VARCHAR(6) NOT NULL,
screening_ID VARCHAR(10) NOT NULL,
seat_ID VARCHAR(7) NOT NULL,
booking_ID VARCHAR(6) NOT NULL,
PRIMARY KEY (seat_Reserve_ID),
FOREIGN KEY (screening_ID) REFERENCES Screening(screening_ID),
FOREIGN KEY (seat_ID) REFERENCES Seat(seat_ID),
FOREIGN KEY (booking_ID) REFERENCES Booking(booking_ID)
);
INSERT INTO Seat_Reserved VALUES ('SR1','SCR1','H3S3','B1');
INSERT INTO Seat_Reserved VALUES ('SR2','SCR4','H1S6','B2');
INSERT INTO Seat_Reserved VALUES ('SR3','SCR3','H2S1','B3');
INSERT INTO Seat_Reserved VALUES ('SR4','SCR2','H3S3','B4');
INSERT INTO Seat_Reserved VALUES ('SR5','SCR4','H1S1','B5');
INSERT INTO Seat_Reserved VALUES ('SR6','SCR3','H2S2','B6');
SELECT * FROM Seat_Reserved;