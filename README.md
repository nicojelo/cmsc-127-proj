# cmsc-127-proj

# IF YOU GONNA BRANCH

if 1st time - Clone repository git clone <url> if update git pull

Create own branch! (forking) creating new branch git checkout -b <branchname> switching back to a branch git checkout <existingbranchname> deleteing branch git branch -d <existingbname>

EDIT AWAY!!!!

saving changes to your branch

 git add *
 git commit -m "<commit message>"
 git push origin <toyourbranch>
pull request (merging your branch to master branch)
# IF DIRECTLY EDIT MASTER BRANCH

if 1st time - clone repository git clone <url>

if update git pull NOTE: RESOLVE CONFLICTS!!

EDIT AWAY!!!

saving changes git add * git commit -m "message"

finalizing changes to master branch git push origin master

-----------------------------------------------------------------------------------------------------------------------------------

	CREATING THE DATABASE

	1) // created the database via "create DATABASE cmsc_127_project" command

	2) // created the tables

	CUSTOMER TABLE
	create TABLE customer (
		customerId int(4) AUTO_INCREMENT,
		lName VARCHAR(16),fName VARCHAR(32),
		mName VARCHAR(16),
		birthday date,
		contactNum varchar(11),
		CONSTRAINT customer_customerid_pk PRIMARY KEY(customerId)
	);

	REWARD CARD TABLE
	create TABLE rewardcard (
		cardId int(12) AUTO_INCREMENT,
		totalPoints int(3) NOT NULL,
		totalStars int(3) NOT NULL,
		customerId int(4),
		CONSTRAINT rewardcard_cardId_pk PRIMARY KEY(cardId),
		CONSTRAINT rewardcard_customerId_fk FOREIGN KEY(customerId)
			REFERENCES customer(customerId)
	);

	REWARD_POINTS TABLE
	create table rewardcard_points (
		validPoints int(3),
		dateReceived date,
		usedPoints int(3),
		dateUsed date,
		cardId int(12),
		CONSTRAINT rewardcard_cardId_uk UNIQUE(cardId)
	);

	REWARD_STARS TABLE
	create table rewardcard_stars (
		validStars int(3),
		dateReceived date,
		expirationDate date,
		usedStars int(3),
		dateUsed date,
		cardId int(12),
		CONSTRAINT rewardcard_cardId_uk UNIQUE(cardId)
	);

	BRANCH TABLE
	create table branch(
		branchId int(2),
		location VARCHAR(32),
		CONSTRAINT branch_branchId_pk PRIMARY KEY(branchId)
	);

	PRODUCT TABLE
	create table product(
		productId int(3),
		productName varchar(32),
		priceValue int(4),
		CONSTRAINT product_productid_pk PRIMARY KEY(productId)
	);

	PROMO TABLE
	create table promo(
		promoId int(3),
		promoStart date,
		promoEnd date,
		branchId int(2),
		CONSTRAINT promo_promoid_pk PRIMARY KEY(promoId),
		CONSTRAINT promo_branchid_fk FOREIGN KEY(branchId)
			REFERENCES branch(branchId)
	);

	PRODUCTS IN PROMO TABLE
	create table promo_product(
		promoId int(3),
		productId int(3),
		CONSTRAINT promoproduct_promoid_fk FOREIGN KEY(promoId)
			REFERENCES promo(promoId),
		CONSTRAINT promoproduct_productid_fk FOREIGN KEY(productId)
			REFERENCES product(productId)
	);

	STOCKS TABLE
	create table stocks (
		stocksId int(3),
		stocksAvailable int(3),
		stocksSold int(3),
		productId int(3),
		branchId int(2),
		CONSTRAINT stocks_stocksid_pk PRIMARY KEY(stocksId),
		CONSTRAINT stocks_productid_fk FOREIGN KEY(productId)
			REFERENCES product(productId),
		CONSTRAINT stocks_branchid_fk FOREIGN KEY(branchId)
			REFERENCES branch(branchId)
	);

	ORDER TABLE
	create TABLE transaction_order(
		orderId int(5) AUTO_INCREMENT,
		quantity int(2),
		price int(5),
		productId int(3),
		CONSTRAINT order_orderid_pk PRIMARY KEY(orderId),
		CONSTRAINT order_productid_fk FOREIGN KEY(productId)
			REFERENCES product(productId)
	);

	TRANSACTION TABLE
	create TABLE transaction(
		transactionId int(4) AUTO_INCREMENT,
		transac_date datetime,
		total_price int(6),
		type VARCHAR(3),
		peso_spent int(6),
		points_spent int(3),
		stars_spent float(2),
		orderId int(5),
		CONSTRAINT transaction_transactionid_pk PRIMARY KEY(transactionId),
		CONSTRAINT transaction_orderid_fk FOREIGN KEY(orderId)
			REFERENCES transaction_order(orderId)
	);

	TRANSACTION TYPE TABLE
	create TABLE transaction_type(
		code varchar(3),
		type varchar(16)
	);

	3) Initialize values to tables

	Transaction Type
		insert into transaction_type("PHP", "Philippine Peso");
		insert into transaction_type("PTS", "Points");
		insert into transaction_type("PSR", "Promo Stars");

	4) Creating triggers: procedure

	-- Insert Customer Procedure --
	CREATE PROCEDURE insertCustomer(
		a varchar(16),
		b varchar(32),
		c varchar(16),
		d varchar(10),
		e varchar(11)
	) BEGIN
	INSERT INTO customer(lName,fName,mName,birthday,contactNum) values(a,b,c,str_to_date(d,'%m/%d/%Y'),e);
	END //


