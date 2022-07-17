CREATE DATABASE IF NOT EXISTS userinformation;

use userinformation;

DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS postcomment;
DROP TABLE IF EXISTS userinformation;

CREATE TABLE userinformation (
	userID BIGINT NOT NULL AUTO_INCREMENT,
	username VARCHAR(30) NOT NULL,
	firstname VARCHAR(20) NOT NULL,
	lastname VARCHAR(25) NOT NULL,
	email VARCHAR(50) NOT NULL, 
	password VARCHAR(30) NOT NULL, 
	regdate DATETIME,
	PRIMARY KEY (userID)
);

CREATE TABLE post (
	postID BIGINT NOT NULL AUTO_INCREMENT,
	userID BIGINT NOT NULL, 
	post LONGTEXT NOT NULL, 
	datecreated DATETIME,
	PRIMARY KEY (postID),
	FOREIGN KEY (userID) REFERENCES userinformation(userID)
);

CREATE TABLE postcomment (
	commentID BIGINT NOT NULL AUTO_INCREMENT,
	postID BIGINT NOT NULL,
	userID BIGINT NOT NULL,
	postcomment LONGTEXT NOT NULL,
	commentdate DATETIME,
	PRIMARY KEY (commentID),
	FOREIGN KEY (postID) REFERENCES post (postID),
	FOREIGN KEY (userID) REFERENCES userinformation(userID)
);
