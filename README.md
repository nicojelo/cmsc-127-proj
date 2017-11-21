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

--------------------------------------------------------------------------------------------------------

	CREATING THE DATABASE

	1) // created the database via "create DATABASE cmsc_127_project" command

	2) // created the tables

	CUSTOMER TABLE
	create TABLE customer (
		customerId int(4) AUTO_INCREMENT,
		lName VARCHAR(16),fName VARCHAR(32),
		mName VARCHAR(16),
		birthday date,
		contactNum int(11),
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


