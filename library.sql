DROP DATABASE IF EXISTS library;
-- creating library database
CREATE DATABASE library;

-- using library database
use library;

-- create user table
CREATE TABLE user (
    userId INT PRIMARY KEY,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30),
    emailId VARCHAR(200) UNIQUE NOT NULL
);

-- create publisher table
CREATE TABLE publisher (
    publisherId INT PRIMARY KEY,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30),
    emailId VARCHAR(200) UNIQUE NOT NULL
);

-- create author table
CREATE TABLE author (
    authorId INT PRIMARY KEY,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30),
    emailId VARCHAR(200) UNIQUE NOT NULL
);

-- create category table
CREATE TABLE category (
    categoryId INT PRIMARY KEY,
    categoryName VARCHAR(30) NOT NULL,
    description VARCHAR(200) NOT NULL
);

-- create book table
CREATE TABLE book (
    bookId INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    authorId INT,
    publisherId INT,
    publishedYear INT,
    quantity INT,
    FOREIGN KEY (authorId) REFERENCES author(authorId),
    FOREIGN KEY (publisherId) REFERENCES publisher(publisherId)
);

-- create a book_category table, which will act as a bridging table for book and category table
CREATE TABLE bookCategory (
	bookId INT,
    categoryId INT,
    PRIMARY KEY (bookId, categoryId),
    FOREIGN KEY (bookId) REFERENCES book(bookId),
    FOREIGN KEY (categoryId) REFERENCES category(categoryId)
);

-- create a transaction table
CREATE TABLE transaction (
	transactionId INT PRIMARY KEY AUTO_INCREMENT,
    bookId INT,
    userId INT,
    transactionDate DATE NOT NULL,
    dueDate DATE NOT NULL,
    returnDate DATE,
    FOREIGN KEY (bookId) REFERENCES book(bookId),
    FOREIGN KEY (userId) REFERENCES user(UserId)
);

-- Insert data in User Table
INSERT INTO user
VALUES
(1, 'Tom', 'Hardy', 'tom.hardy@gmail.com'),
(2, 'Tom', 'Hanks', 'tom.hanks@gmail.com'),
(3, 'Daniel', 'Lewis', 'daniel.day.lewis@rediffmail.com'),
(4, 'Denzel', 'Washington', 'denzel.washington@gmail.com'),
(5, 'Robert', 'DeNiro', 'robert.deniro@hotmail.com'),
(6, 'Meryl', 'Streep', 'meryl.streep@hotmail.com'),
(7, 'Emily', 'Blunt', 'emily.blunt@rediffmail.com'),
(8, 'Emma', 'Watson', 'emma.watson@gmail.com'),
(9, 'Conan', "O'Brian", 'conan.o.brian@gmail.com'),
(10, 'Taylor', 'Tomlinson', 'taylor.tomlinson@gmail.com')
;


-- Insert data in publisher Table
INSERT INTO publisher
VALUES
(1, 'Quentin', 'Tarantino', 'quentin.tarentino@gmail.com'),
(2, 'James', 'Cameron', 'james.cameron@gmail.com'),
(3, 'Christopher', 'Nolan', 'christopher.nolan@rediffmail.com'),
(4, 'Martin', 'Scorsese', 'marty.scorsese@gmail.com'),
(5, 'Greta', 'Gerwig', 'greta.gerwig@hotmail.com'),
(6, 'Todd', 'Phillips', 'todd.phillips@hotmail.com'),
(7, 'Lulu', 'Wang', 'lulu.wang@rediffmail.com'),
(8, 'Kathryn', 'Bigelow', 'kathryn.bigelow@gmail.com'),
(9, 'Chloe', "Zhao", 'chloe.zhao@gmail.com'),
(10, 'Taylor', 'Tomlinson', 'taylor.tomlinson@gmail.com')
;


-- Insert data in publisher Table
INSERT INTO author
VALUES
(1, 'Khaled', 'Hosseini', 'khadel.hosseini@gmail.com'),
(2, 'Dan', 'Brown', 'dan.brown@gmail.com'),
(3, 'Markus', 'Zusak', 'markus.zusak@rediffmail.com'),
(4, 'Kazuo', 'Ishiguro', 'kazuo.ishiguro@gmail.com'),
(5, 'Anthony', 'Doerr', 'anthony.doerr@hotmail.com'),
(6, 'JK', 'Rowling', 'jk.rowling@hotmail.com'),
(7, 'Agatha', 'Christie', 'agatha.christie@rediffmail.com'),
(8, 'Jane', 'Austen', 'jane.austen@gmail.com'),
(9, 'Harper', "Lee", 'harper.lee@gmail.com'),
(10, 'Charlotte', 'Bronte', 'charlotte.bronte@gmail.com'),
(11, 'Walter', 'Isaacson', 'walter.isaacson@gmail.com ')
;

-- Insert data in category Table
INSERT INTO category
VALUES
(1, 'Fiction', 'literature in the form of prose that describes imaginary events and people'),
(2, 'Non-Fiction', 'prose writing that is based on facts, real events, and real people'),
(3, 'Historical', 'Historical Fiction is set in a real place, during a culturally recognizable time'),
(4, 'Romance',  'novel which places its primary focus on the relationship and romantic love between two people'),
(5, 'Thriller',  'Thriller is a genre of fiction with numerous, often overlapping, subgenres, including crime, horror, and detective fiction'),
(6, 'Bildungsroman', "a novel dealing with one person's formative years or spiritual education"),
(7, 'Fantasy',  'literature set in an imaginary universe, often but not always without any locations, events, or people from the real world'),
(8, 'Detective Novel',  'subgenre of crime fiction and mystery fiction in which a detective or investigator investigates a crime, often murder'),
(9, 'Biography', "nonfiction account of a real person's life written by someone else"),
(10, 'Mystery',  'genre where the nature of an event, usually a murder or other crime, remains mysterious until the end of the story'),
(11, 'War', 'genre where a war is involved'),
(12,'Illustrated Novel', 'extended narrative with multiple images that, together with the text, produce meaning.'),
(13,'Dystopian','relating to or denoting an imagined state or society where there is great suffering or injustice'),
(14,'Science Fiction','fiction based on imagined future scientific or technological advances'),
(15, 'Literature', 'written works, especially those considered of superior or lasting artistic merit'),
(16, 'Psychological Thriller', 'used to describe literature or films that deal with psychological narratives in a thriller or thrilling setting'),
(17,'Crime', 'the inclusion of violence, murder, theft, betrayal'),
(18,'Fairy Tale','Genre of magical story, usually originating in folklore')
;

-- Insert data in book Table
INSERT INTO book
VALUES
(1,'The Kite Runner',1,10,2003,50),
(2,'A Thousand Splendid Suns',1,10,2007,50),
(3,'And The Mountains Echoed',1,8,2013,20),
(4,'Sea Prayer',1,10,2018,15),
(5,'Digital Fortress',2,8,1998,25),
(6,'Angels & Demons',2,3,2000,47),
(7,'The Da Vinci Code',2,4,2003,53),
(8,'Deception Point',2,4,2006,22),
(9,'The Lost Symbol',2,9,2009,19),
(10,'Inferno',2,5,2013,37),
(11,'Origin',2,7,2017,40),
(12,'The Book Thief',3,9,2005,57),
(13,'Bridge of Clay',3,5,2018,11),
(14,'The Messenger',3,5,2002,14),
(15,'When Dogs Cry',3,5,2001,12),
(16,'Fighting Ruben Wolfe',3,9,2000,50),
(17,'The Underdog',3,6,1999,30),
(18,'Never Let Me Go',4,6,2005,23),
(19,'The Remains of the Day',4,6,1989,36),
(20,'Klara and the Sun',4,6,2021,13),
(21,'The Buried Giant',4,6,2015,17),
(22,'An artist of the Floating World',4,6,1986,14),
(23,'The Unconsoled',4,8,1995,7),
(24,'All the Light We Cannot See',5,8,2014,57),
(25,'Cloud Cuckoo Land',5,8,2021,16),
(26,'About Grace',5,8,2004,17),
(27,'The Shell Collector',5,8,2002,12),
(28,"Harry Potter and the Sorcerer's Stone",6,2,1997,53),
(29,'The Ink Black Heart',6,2,2022,9),
(30,'Fantastic Beasts and Where to Find Them',6,2,2001,15),
(31,'The Running Grave',6,2,2023,28),
(32,'The Ickabog',6,9,2020,22),
(33,'Troubled Blood',6,8,2020,10),
(34,'Murder on the Orient Express',7,2,1934,10),
(35,'Halloween Party',7,2,1969,5),
(36,'Death on the Nile',7,1,1937,12),
(37,'Pride and Prejudice',8,2,1813,13),
(38,'Emma',8,2,1815,4),
(39,'Persuasion',8,2,1817,3),
(40,'Sense and Sensibility',8,2,1811,4),
(41,'Northanger Abbey',8,2,1817,3),
(42,'To Kill a Mockingbird',9,7,1960,45),
(43,'Go Set a Watchman',9,7,2015,10),
(44,'Jane Eyre',10,1,1847,5),
(45,'Villette',10,1,1853,5),
(46,'The Professor',10,1,1857,5),
(47,'Shirley, A Tale',10,1,1849,2),
(48,'Poems by Currer, Ellis, and Acton Bell',10,1,1846,5),
(49,'Steve Jobs',11,6,2011,7)
;

-- Insert data in bookCategory table
INSERT INTO bookCategory
VALUES
(1,1),(1,3),(1,6),
(2,1),(2,3),(2,11),
(3,1),(3,3),(3,11),
(4,2),(4,12),
(5,1),(5,5),(5,10),
(6,1),(6,5),(6,8),(6,10),
(7,1),(7,5),(7,8),(7,10),
(8,1),(8,5),(8,10),
(9,1),(9,5),(9,8),(9,10),
(10,1),(10,5),(10,8),(10,10),
(11,1),(11,5),(11,8),(11,10),
(12,1),(12,3),(12,6),(12,11),
(13,1),
(14,1),(14,13),
(15,1),
(16,1),
(17,1),
(18,1),(18,13),(18,14),
(19,1),(19,3),(19,15),
(20,1),(20,13),(20,14),
(21,1),(21,7),
(22,1),(22,3),(22,15),
(23,1),(23,10),(12,16),
(24,1),(24,3),
(25,1),(25,3),
(26,1),
(27,1),
(28,1),(28,7),
(29,1),(29,17),
(30,1),(30,7),
(31,1),(31,17),
(32,1),(32,18),
(33,1),(33,17),
(34,1),(34,8),
(35,1),(35,8),
(36,1),(36,8),
(37,1),(37,4),
(38,1),
(39,1),(39,3),(39,4),
(40,1),(40,4),
(41,2),
(42,1),
(43,1),
(44,1),(44,4),
(45,1),(45,4),
(46,1),(46,4),
(47,1),
(48,15),
(49,2),(49,9)
;

-- Insert data in transaction table

INSERT INTO transaction (bookId,userId,transactionDate,dueDate,returnDate )
VALUES
(2,4,'2023-11-15','2023-11-29','2023-11-29');

SELECT * FROM transaction;

START TRANSACTION;
INSERT INTO transaction (bookId,userId,transactionDate,dueDate,returnDate )
VALUES
(2,4,'2023-11-15','2023-11-29','2023-11-29');
SAVEPOINT tom;

UPDATE book
SELECT * FROM actor;

ROLLBACK TO SAVEPOINT tom;

SELECT * FROM actor;
