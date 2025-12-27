#Library Database Analysis
CREATE DATABASE library_db;
USE library_db;

-- Table: tbl_publisher
CREATE TABLE tbl_publisher (
    publisher_PublisherName VARCHAR(255) PRIMARY KEY,
    publisher_PublisherAddress TEXT,
    publisher_PublisherPhone VARCHAR(15)
);

-- Table: tbl_book
CREATE TABLE tbl_book (
    book_BookID INT PRIMARY KEY,
    book_Title VARCHAR(255),
    book_PublisherName VARCHAR(255),
    FOREIGN KEY (book_PublisherName)
        REFERENCES tbl_publisher(publisher_PublisherName)
);

-- Table: tbl_book_authors
CREATE TABLE tbl_book_authors (
    book_authors_AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    book_authors_BookID INT,
    book_authors_AuthorName VARCHAR(255),
    FOREIGN KEY (book_authors_BookID)
        REFERENCES tbl_book(book_BookID)
);

-- Table: tbl_library_branch
CREATE TABLE tbl_library_branch (
    library_branch_BranchID INT AUTO_INCREMENT PRIMARY KEY,
    library_branch_BranchName VARCHAR(255),
    library_branch_BranchAddress TEXT
);

-- Table: tbl_book_copies
CREATE TABLE tbl_book_copies (
    book_copies_CopiesID INT AUTO_INCREMENT PRIMARY KEY,
    book_copies_BookID INT,
    book_copies_BranchID INT,
    book_copies_No_Of_Copies INT,
    FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID)
);

-- Table: tbl_borrower
CREATE TABLE tbl_borrower (
    borrower_CardNo INT PRIMARY KEY,
    borrower_BorrowerName VARCHAR(255),
    borrower_BorrowerAddress TEXT,
    borrower_BorrowerPhone VARCHAR(15)
);

-- Table: tbl_book_loans
CREATE TABLE tbl_book_loans (
    book_loans_LoansID INT AUTO_INCREMENT PRIMARY KEY,
    book_loans_BookID INT,
    book_loans_BranchID INT,
    book_loans_CardNo INT,
    book_loans_DateOut DATE,
    book_loans_DueDate DATE,
    FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID),
    FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo)
);


select * from tbl_publisher;
select * from tbl_book;
select * from tbl_book_authors;
select * from tbl_library_branch;
select * from tbl_book_copies;
select * from tbl_borrower;
select * from  tbl_book_loans;

-- Inserting into tbl_publisher
INSERT INTO tbl_publisher (publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone) VALUES
('DAW Books', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
('Viking', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
('Signet Books', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
('Chilton Books', 'Not Available', 'Not Available'),
('George Allen & Unwin', '83 Alexander Ln, Crows Nest NSW 2065, Australia', '-8466'),
('Alfred A. Knopf', 'The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019', '212-940-7390'),
('Bloomsbury', 'Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018', '212-419-5300'),
('Shinchosa', 'Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan', '-12006'),
('Harper and Row', 'HarperCollins Publishers, 195 Broadway, New York, NY 10007', '212-207-7000'),
('Pan Books', '175 Fifth Avenue, New York, NY 10010', '646-307-5745'),
('Chalto & Windus', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
('Harcourt Brace Jovanovich', '3 Park Ave, New York, NY 10016', '212-420-5800'),
('W.W. Norton', 'W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110', '212-354-5500'),
('Scholastic', '557 Broadway, New York, NY 10012', '800-724-6527'),
('Bantam', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
('Picador USA', '175 Fifth Avenue, New York, NY 10010', '646-307-5745');

-- Inserting into tbl_book
INSERT INTO tbl_book (book_BookID, book_Title, book_PublisherName) VALUES
(1, 'The Name of the Wind', 'DAW Books'),
(2, 'It', 'Viking'),
(3, 'The Green Mile', 'Signet Books'),
(4, 'Dune', 'Chilton Books'),
(5, 'The Hobbit', 'George Allen & Unwin'),
(6, 'Eragon', 'Alfred A. Knopf'),
(7, 'A Wise Mans Fear', 'DAW Books'),
(8, 'Harry Potter and the Philosophers Stone', 'Bloomsbury'),
(9, 'Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
(10, 'The Giving Tree', 'Harper and Row'),
(11, 'The Hitchhikers Guide to the Galaxy', 'Pan Books'),
(12, 'Brave New World', 'Chalto & Windus'),
(13, 'The Princess Bride', 'Harcourt Brace Jovanovich'),
(14, 'Fight Club', 'W.W. Norton'),
(15, 'Holes', 'Scholastic'),
(16, 'Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
(17, 'Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
(18, 'The Martian', 'Crown'),
(19, 'A Game of Thrones', 'Bantam'),
(20, 'The Lost Tribe', 'Picador USA');

-- Inserting into tbl_book_authors
INSERT INTO tbl_book_authors (book_authors_BookID, book_authors_AuthorName) VALUES
(1, 'Patrick Rothfuss'),
(2, 'Stephen King'),
(3, 'Stephen King'),
(4, 'Frank Herbert'),
(5, 'J.R.R. Tolkien'),
(6, 'Christopher Paolini'),
(7, 'Patrick Rothfuss'),
(8, 'J.K. Rowling'),
(9, 'Haruki Murakami'),
(10, 'Shel Silverstein'),
(11, 'Douglas Adams'),
(12, 'Aldous Huxley'),
(13, 'William Goldman'),
(14, 'Chuck Palahniuk'),
(15, 'Louis Sachar'),
(16, 'J.K. Rowling'),
(17, 'J.K. Rowling'),
(18, 'Andy Weir'),
(19, 'George R.R. Martin'),
(20, 'Mark Lee');

-- Inserting into tbl_library_branch
INSERT INTO tbl_library_branch (library_branch_BranchName, library_branch_BranchAddress) VALUES
('Sharpstown', '32 Corner Road'),
('Central', '491 3rd Street'),
('Saline', '40 State Street'),
('Ann Arbor', '101 South University');

-- Inserting into tbl_borrower
INSERT INTO tbl_borrower (borrower_CardNo, borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone) VALUES
(100, 'Joe Smith', '1321 4th Street, New York, NY 10014', '212-312-1234'),
(101, 'Jane Smith', '1321 4th Street, New York, NY 10014', '212-931-4124'),
(102, 'Tom Li', '981 Main Street, Ann Arbor, MI 48104', '734-902-7455'),
(103, 'Angela Thompson', '2212 Green Avenue, Ann Arbor, MI 48104', '313-591-2122'),
(104, 'Harry Emnace', '121 Park Drive, Ann Arbor, MI 48104', '412-512-5522'),
(105, 'Tom Michael', '5232 5th Avenue, New York, NY 10014', '212-542-5251'),
(106, 'Humphrey Kneegrow', '1321 4th Street, New York, NY 10014', '212-542-5251'),
(107, 'Richie Rich', '1000 1st Avenue, New York, NY 10014', '212-542-5251');

-- Inserting into tbl_book_copies
INSERT INTO tbl_book_copies (book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies) VALUES
(1, 1, 5), 
(2, 1, 5), 
(3, 1, 5), 
(4, 1, 5), 
(5, 1, 5), 
(6, 1, 5), 
(7, 1, 5), 
(8, 1, 5), 
(9, 1, 5), 
(10, 1, 5),
(11, 1, 5), 
(12, 1, 5), 
(13, 1, 5), 
(14, 1, 5), 
(15, 1, 5), 
(16, 1, 5), 
(17, 1, 5), 
(18, 1, 5), 
(19, 1, 5), 
(20, 1, 5),
(1, 2, 5), 
(2, 2, 5), 
(3, 2, 5), 
(4, 2, 5), 
(5, 2, 5), 
(6, 2, 5), 
(7, 2, 5), 
(8, 2, 5), 
(9, 2, 5), 
(10, 2, 5),
(11, 2, 5), 
(12, 2, 5), 
(13, 2, 5), 
(14, 2, 5), 
(15, 2, 5), 
(16, 2, 5), 
(17, 2, 5), 
(18, 2, 5), 
(19, 2, 5), 
(20, 2, 5),
(1, 3, 5), 
(2, 3, 5), 
(3, 3, 5), 
(4, 3, 5), 
(5, 3, 5), 
(6, 3, 5), 
(7, 3, 5), 
(8, 3, 5), 
(9, 3, 5), 
(10, 3, 5),
(11, 3, 5), 
(12, 3, 5), 
(13, 3, 5), 
(14, 3, 5), 
(15, 3, 5), 
(16, 3, 5), 
(17, 3, 5), 
(18, 3, 5), 
(19, 3, 5), 
(20, 3, 5),
(1, 4, 5), 
(2, 4, 5), 
(3, 4, 5), 
(4, 4, 5), 
(5, 4, 5), 
(6, 4, 5), 
(7, 4, 5), 
(8, 4, 5), 
(9, 4, 5), 
(10, 4, 5),
(11, 4, 5), 
(12, 4, 5), 
(13, 4, 5), 
(14, 4, 5), 
(15, 4, 5), 
(16, 4, 5), 
(17, 4, 5), 
(18, 4, 5), 
(19, 4, 5), 
(20, 4, 5);

-- Inserting into tbl_book_loans
INSERT INTO tbl_book_loans (book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate) VALUES
(1, 1, 100, '2018-01-01', '2018-02-02'),
(2, 1, 100, '2018-01-01', '2018-02-02'),
(3, 1, 100, '2018-01-01', '2018-02-02'),
(4, 1, 100, '2018-01-01', '2018-02-02'),
(5, 1, 102, '2018-01-03', '2018-02-03'),
(6, 1, 102, '2018-01-03', '2018-02-03'),
(7, 1, 102, '2018-01-03', '2018-02-03'),
(8, 1, 102, '2018-01-03', '2018-02-03'),
(9, 1, 102, '2018-01-03', '2018-02-03'),
(11, 1, 102, '2018-01-03', '2018-02-03'),
(12, 1, 102, '2018-01-03', '2018-02-03'),
(10, 1, 102, '2018-01-03', '2018-02-03'),
(20, 1, 100, '2018-02-03', '2018-03-02'),
(20, 2, 100, '2018-02-03', '2018-03-02'),
(20, 3, 100, '2018-02-03', '2018-03-02'),
(20, 4, 100, '2018-02-03', '2018-03-02'),
(1, 1, 102, '2018-02-03', '2018-03-02'),
(2, 1, 102, '2018-02-03', '2018-03-02'),
(3, 1, 102, '2018-02-03', '2018-03-02'),
(4, 1, 102, '2018-02-03', '2018-03-02'),
(5, 1, 102, '2018-02-03', '2018-03-02'),
(6, 1, 102, '2018-02-03', '2018-03-02'),
(7, 1, 102, '2018-02-03', '2018-03-02'),
(8, 1, 102, '2018-02-03', '2018-03-02'),
(9, 1, 102, '2018-02-03', '2018-03-02'),
(10, 1, 102, '2018-02-03', '2018-03-02'),
(11, 1, 102, '2018-02-03', '2018-03-02'),
(12, 1, 102, '2018-02-03', '2018-03-02'),
(13, 1, 102, '2018-02-03', '2018-03-02'),
(14, 1, 102, '2018-02-03', '2018-03-02'),
(15, 1, 102, '2018-02-03', '2018-03-02'),
(16, 1, 102, '2018-02-03', '2018-03-02'),
(17, 1, 102, '2018-02-03', '2018-03-02'),
(18, 1, 102, '2018-02-03', '2018-03-02'),
(19, 1, 102, '2018-02-03', '2018-03-02'),
(20, 1, 102, '2018-02-03', '2018-03-02'),
(1, 1, 103, '2018-02-03', '2018-03-02'),
(2, 1, 103, '2018-02-03', '2018-03-02'),
(3, 1, 103, '2018-02-03', '2018-03-02'),
(4, 1, 103, '2018-02-03', '2018-03-02'),
(5, 1, 103, '2018-02-03', '2018-03-02'),
(6, 1, 103, '2018-02-03', '2018-03-02'),
(7, 1, 103, '2018-02-03', '2018-03-02'),
(8, 1, 103, '2018-02-03', '2018-03-02'),
(9, 1, 103, '2018-02-03', '2018-03-02'),
(10, 1, 103, '2018-02-03', '2018-03-02'),
(11, 1, 103, '2018-02-03', '2018-03-02'),
(12, 1, 103, '2018-02-03', '2018-03-02'),
(13, 1, 103, '2018-02-03', '2018-03-02'),
(14, 1, 103, '2018-02-03', '2018-03-02'),
(15, 1, 103, '2018-02-03', '2018-03-02');


# 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
SELECT bc.book_copies_No_Of_Copies
FROM tbl_book b
JOIN tbl_book_copies bc ON b.book_BookID = bc.book_copies_BookID
JOIN tbl_library_branch lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE b.book_Title = 'The Lost Tribe'
  AND lb.library_branch_BranchName = 'Sharpstown';

# 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?
SELECT lb.library_branch_BranchName,
       bc.book_copies_No_Of_Copies
FROM tbl_book b
JOIN tbl_book_copies bc ON b.book_BookID = bc.book_copies_BookID
JOIN tbl_library_branch lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE b.book_Title = 'The Lost Tribe';

# 3. Retrieve the names of all borrowers who do not have any books checked out.
SELECT br.borrower_BorrowerName
FROM tbl_borrower br
LEFT JOIN tbl_book_loans bl
    ON br.borrower_CardNo = bl.book_loans_CardNo
WHERE bl.book_loans_CardNo IS NULL;

# 4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address.
SELECT b.book_Title,
       br.borrower_BorrowerName,
       br.borrower_BorrowerAddress
FROM tbl_book_loans bl
JOIN tbl_book b ON bl.book_loans_BookID = b.book_BookID
JOIN tbl_borrower br ON bl.book_loans_CardNo = br.borrower_CardNo
JOIN tbl_library_branch lb ON bl.book_loans_BranchID = lb.library_branch_BranchID
WHERE lb.library_branch_BranchName = 'Sharpstown'
  AND bl.book_loans_DueDate = '2018-02-03';

# 5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
SELECT lb.library_branch_BranchName,
       COUNT(bl.book_loans_LoansID) AS Total_Loans
FROM tbl_library_branch lb
LEFT JOIN tbl_book_loans bl
    ON lb.library_branch_BranchID = bl.book_loans_BranchID
GROUP BY lb.library_branch_BranchName;

# 6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
SELECT br.borrower_BorrowerName,
       br.borrower_BorrowerAddress,
       COUNT(bl.book_loans_LoansID) AS Books_Checked_Out
FROM tbl_borrower br
JOIN tbl_book_loans bl
    ON br.borrower_CardNo = bl.book_loans_CardNo
GROUP BY br.borrower_CardNo
HAVING COUNT(bl.book_loans_LoansID) > 5;

# 7. For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
SELECT b.book_Title,
       bc.book_copies_No_Of_Copies
FROM tbl_book b
JOIN tbl_book_authors ba ON b.book_BookID = ba.book_authors_BookID
JOIN tbl_book_copies bc ON b.book_BookID = bc.book_copies_BookID
JOIN tbl_library_branch lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE ba.book_authors_AuthorName = 'Stephen King'
  AND lb.library_branch_BranchName = 'Central';
