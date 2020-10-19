
ALTER TABLE People
ADD CONSTRAINT UniqName UNIQUE(p_name);

ALTER TABLE People
ADD CONSTRAINT CheckAge CHECK (age>12);

INSERT INTO Booking VALUES ('B15',575,'SCR4','P13');

create trigger onBooking on Booking after insert  
as  
declare @log_action varchar(20); 
declare @booking_ID varchar(6); 
declare @price INT; 
declare @screening_ID VARCHAR(10); 
declare @p_ID VARCHAR (10); 
select @booking_ID=i.booking_ID,@price=i.price,@screening_ID=i.screening_ID from inserted i; 
set @log_action='inserted record'; 
insert into TriggerClass (booking_ID,price,screening_ID,p_ID,log_action,log_timestamp) values (@booking_ID,@price,@screening_ID,@p_ID,@log_action,getdate()); 
print 'after insert triggered fired' 
go

ALTER TABLE Movie
ADD CONSTRAINT CheckMovieLength CHECK (movie_length>100);

ALTER TABLE Screening
ADD CONSTRAINT CheckSDate CHECK (screen_date>getdate()); 






