CREATE TABLE user1 (
  email VARCHAR(35) UNIQUE NOT NULL, 
  password VARCHAR(35) NOT NULL, 
  admin BOOLEAN,
  primary key (email)
);

CREATE TABLE publisherBank (
  pubName VARCHAR(15) UNIQUE NOT NULL, 
  email VARCHAR(35),  
  phoneNumbers INTEGER,
  bankingID INTEGER UNIQUE NOT NULL,
  institNum INTEGER NOT NULL,
  accountNum INTEGER NOT NULL,
  transitNumber INTEGER NOT NULL,
  primary key (pubName)
);

CREATE TABLE address (
  addressID INT UNIQUE NOT NULL, 
  streetNumber INT NOT NULL,
  streetName VARCHAR(15) NOT NULL,
  City VARCHAR(15) NOT NULL,
  Country VARCHAR(15) NOT NULL,
  postalCode CHAR(6) NOT NULL,
  primary key (addressID)
);

CREATE TABLE generalReport (
  reportID INT UNIQUE NOT NULL, 
  salesVsExpenditures FLOAT(2), 
  primary key (reportID)
);

CREATE TABLE genreReport (
  genre VARCHAR(25) UNIQUE NOT NULL, 
  salesValue FLOAT(2), 
  expenditureValue FLOAT(2),
  primary key (genre)
);

CREATE TABLE authorReport (
  author VARCHAR(15) UNIQUE NOT NULL, 
  salesValue FLOAT(2), 
  expenditureValue FLOAT(2),
  primary key (author)
);

CREATE TABLE shippingInfo (
  shippingID INT UNIQUE NOT NULL, 
  sFname VARCHAR(15),
  sLname VARCHAR(15),
  addressID INT,
  primary key (shippingID),
  foreign key (addressID) REFERENCES address(addressID) on 
	update 
		cascade
);

CREATE TABLE billingInfo (
  billingID INT UNIQUE NOT NULL, 
  bFname VARCHAR(15),
  bLname VARCHAR(15),
  addressID INT,
  cardNumber INT NOT NULL,
  nameOnCard VARCHAR(30) NOT NULL,
  expDate CHAR(5) NOT NULL,
  CVC INT NOT NULL,
  primary key (billingID),
  foreign key (addressID) REFERENCES address(addressID) on 
	update 
		cascade
);

CREATE TABLE order1 (
  orderID INT UNIQUE NOT NULL, 
  email VARCHAR(35),
  primary key (orderID),
  foreign key (email) REFERENCES user1(email) on 
	update 
		cascade
);

CREATE TABLE warehouse (
  storageID INT UNIQUE NOT NULL, 
  stock INT,
  threshold INT,
  monthSales FLOAT(2),
  salesPercent FLOAT(2),
  bankingID INTEGER,
  primary key (storageID),
  foreign key (bankingID) REFERENCES publisherBank(bankingID) on 
	update 
		cascade
);

CREATE TABLE book (
	isbn INT UNIQUE NOT NULL,
	title varchar(35),
	author varchar(15) NOT NULL,
	genre varchar(10),
	numPages INT,
	price float(2),
	publisher varchar(15),
	storageID INT UNIQUE NOT NULL,
	PRIMARY KEY (isbn, storageID),
	FOREIGN KEY (publisher) REFERENCES publisherBank(pubName) on 
		update 
			cascade,
	FOREIGN KEY (storageID) REFERENCES warehouse(storageID) on 
		update 
			cascade
);

CREATE TABLE finalize (
	storageID INT UNIQUE NOT NULL,
	reportID INT UNIQUE NOT NULL,
	PRIMARY KEY (storageID, reportID),
	FOREIGN KEY (storageID) REFERENCES warehouse(storageID) on 
		update 
			cascade,
	FOREIGN KEY (reportID) REFERENCES generalReport(reportID) on 
		update 
			cascade
);

CREATE TABLE reportsTo (
	author varchar(25) UNIQUE NOT NULL,
	genre varchar(15) UNIQUE NOT NULL,
	reportID INT UNIQUE NOT NULL,
	PRIMARY KEY (author, genre, reportID),
	FOREIGN KEY (author) REFERENCES authorReport(author) on 
		update 
			cascade,
	FOREIGN KEY (genre) REFERENCES genreReport(genre) on 
		update 
			cascade,
	FOREIGN KEY (reportID) REFERENCES generalReport(reportID) on 
		update 
			cascade
);

CREATE TABLE accesses (
	email varchar(35) UNIQUE NOT NULL,
	reportID INT UNIQUE NOT NULL,
	PRIMARY KEY (email, reportID),
	FOREIGN KEY (email) REFERENCES user1(email) on 
		update 
			cascade,
	FOREIGN KEY (reportID) REFERENCES generalReport(reportID) on 
		update 
			cascade
);

CREATE TABLE alters (
	isbn INT UNIQUE NOT NULL,
	email varchar(35) NOT NULL,
	PRIMARY KEY (isbn),
	FOREIGN KEY (isbn) REFERENCES book(isbn) on 
		update 
			cascade,
	FOREIGN KEY (email) REFERENCES user1(email) on 
		update 
			cascade
);

CREATE TABLE inserts (
	email varchar(35) UNIQUE NOT NULL,
	billingID INT UNIQUE NOT NULL,
	shippingID INT UNIQUE NOT NULL,
	PRIMARY KEY (email, billingID, shippingID),
	FOREIGN KEY (email) REFERENCES user1(email) on 
		update 
			cascade,
	FOREIGN KEY (billingID) REFERENCES billingInfo(billingID) on 
		update 
			cascade,
	FOREIGN KEY (shippingID) REFERENCES shippingInfo(shippingID) on 
		update 
			cascade
);

CREATE TABLE orderedTo (
	orderID INT UNIQUE NOT NULL,
	shippingID INT UNIQUE NOT NULL,
	billingID INT UNIQUE NOT NULL,
	PRIMARY KEY (orderID),
	FOREIGN KEY (orderID) REFERENCES order1(orderID) on 
		update 
			cascade,
	FOREIGN KEY (shippingID) REFERENCES shippingInfo(shippingID) on 
		update 
			cascade,
	FOREIGN KEY (billingID) REFERENCES billingInfo(billingID) on 
		update 
			cascade
);

CREATE TABLE pubBook (
	isbn INT UNIQUE NOT NULL,
	pubName VARCHAR(15) NOT NULL,
	PRIMARY KEY (isbn),
	FOREIGN KEY (isbn) REFERENCES book(isbn) on 
		update 
			cascade,
	FOREIGN KEY (pubName) REFERENCES publisherBank(pubName) on 
		update 
			cascade
);

CREATE TABLE addToBasket (
	isbn INT UNIQUE NOT NULL,
	email varchar(15) UNIQUE NOT NULL,
	quantity INT,
	PRIMARY KEY (isbn, email),
	FOREIGN KEY (isbn) REFERENCES book(isbn) on 
		update 
			cascade,
	FOREIGN KEY (email) REFERENCES user1(email) on 
		update 
			cascade
);

CREATE TABLE phoneNumbers (
	pubName varchar(15) UNIQUE NOT NULL,
	phoneNumbers INT,
	PRIMARY KEY (pubName),
	FOREIGN KEY (pubName) REFERENCES publisherBank(pubName) on 
		update 
			cascade
);
