CREATE database testdb;
use testdb;

CREATE TABLE users(
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username varchar(20) NOT NULL,
	password varchar(20)
);

INSERT INTO users VALUES(1, '����', '123456');
INSERT INTO users VALUES(null,'����','888888');
INSERT INTO users VALUES(null,'wustzz','wustzz');

SELECT * FROM users;

