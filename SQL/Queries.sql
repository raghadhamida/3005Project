-- Note that values used are sample to represent what might be used in the proper format

-- Handling the first admin user to be made to be the first user of the database
INSERT INTO user1 
VALUES ('admin@sample.com', 'admin12345', TRUE);

--Handling regular non admin users being made
INSERT INTO user1
VALUES ('johndoe@sample.com', 'johndoe12345', FALSE);

INSERT INTO address
VALUES (1, 123, 'Main St', 'New York', 'USA', '10001');

INSERT INTO shippingInfo
VALUES (1, 'John', 'Doe', 1);

INSERT INTO address
VALUES (2, 1234, 'Main St', 'New York', 'United States', '10001');

INSERT INTO billingInfo
VALUES (1, 'John', 'Smith', 2, 1234567890123456, 'John Smith', '12/22', 123);

INSERT INTO inserts
VALUES ('john.smith@sample.com', 1, 1);

--Handling when user adds a book along with its publisher (creates a publisher one does not exist already)
--There must be storage in the warehouse to accomodate this book so the admin inputs this aswell
INSERT INTO warehouse 
VALUES (1, 10, 5, 0.0, 0.0, 0.5, 1);

INSERT INTO publisherBank
VALUES ('Penguin Books', 'penguinbooks@sample.com', 1234567890, 1, 123456, 123456789, 1234);

INSERT INTO book
VALUES (123456789, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 180, 9.99, 'Penguin Books', 1);

INSERT INTO alters
VALUES (123456789, 'admin@sample.com');

--Handling when User adds to their basket
INSERT INTO addToBasket
VALUES (123456789, 'john.smith@sample.com', 1);

--Handling when an order is made and placed
INSERT INTO order1
VALUES (1, 'john.smith@sample.com');

--If user's default shipping and billing information is used
INSERT INTO orderedTo
VALUES (1, 1, 1);

--If user's inputs new shipping and billing information
INSERT INTO address
VALUES (3, 321, 'Ridgemont St', 'Chicago', 'United States', '20002');

INSERT INTO shippingInfo
VALUES (2, 'Jane', 'Doe', 3);

INSERT INTO address
VALUES (4, 4321, 'Peverill St', 'Washington', 'United States', '20002');

INSERT INTO billingInfo
VALUES (2, 'Joseph', 'Smith', 4, 1234561234567890, 'Joseph Smith', '11/23', 321);

INSERT INTO orderedTo
VALUES (1, 2, 2);

--Handling when monthly reports are made
--Note that this would be repeated for every genre from the books
INSERT INTO genreReport
VALUES ('Fiction', 0.0, 0.0);

INSERT INTO authorReport
VALUES ('F. Scott Fitzgerald', 0.0, 0.0);

INSERT INTO reportsTo
VALUES ('F. Scott Fitzgerald', 'Fiction', 1);

INSERT INTO generalReport 
VALUES (1, 0.5);

INSERT INTO accesses
VALUES ('admin@sample.com', 1);




