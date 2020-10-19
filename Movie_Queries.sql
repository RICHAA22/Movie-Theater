SELECT movie_title, movie_director,movie_length, movie_genre, hall_ID
FROM Movie
INNER JOIN Screening
ON Screening.movie_ID =Movie.movie_ID
WHERE screen_date = '2020-10-06';

SELECT seat_ID,seat_row,seat_number
FROM Seat
INNER JOIN Hall
ON Seat.hall_ID=Hall.hall_ID
WHERE Hall.hall_name='EXecutive';

SELECT movie_title,hall_ID,screen_date,screen_time
FROM Screening
INNER JOIN Movie
ON Screening.movie_ID=Movie.movie_ID
WHERE movie_title='Avengers Endgame';

SELECT p_name,age, phonenumber
FROM People
INNER JOIN Booking
ON People.p_ID=Booking.p_ID
INNER JOIN Screening
ON Screening.screening_ID=Booking.screening_ID
INNER JOIN Movie
ON Screening.movie_ID=Movie.movie_ID
WHERE movie_title='Avengers Endgame';

SELECT Seat.hall_ID, movie_title,screen_time,seat_row,seat_number
FROM Seat
INNER JOIN Seat_Reserved
ON Seat.seat_ID=Seat_Reserved.seat_ID
INNER JOIN Screening
ON Screening.screening_ID=Seat_Reserved.screening_ID
INNER JOIN Movie
ON Screening.movie_ID=Movie.movie_ID
WHERE screen_date='2020-10-07' AND Seat.hall_ID='H2';
