CREATE DATABASE IF NOT EXISTS `myDb`;
USE `myDb`;
CREATE TABLE computers (
	id int(6) NOT NULL auto_increment,
	ip varchar(15) NOT NULL,
	port varchar(15) NOT NULL,
	name varchar(20) NOT NULL,
	os varchar(10) NOT NULL,
	jar varchar(40) NOT NULL,
	status varchar(30) NOT NULL,
	time varchar(13) NOT NULL,
	secret varchar(13) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE(secret)
);
INSERT INTO `computers` (`id`, `ip`, `port`, `name`, `os`, `jar`, `status`, `time`, `secret`) VALUES
(1, 'localhost', '23', 'Jenkin Master', 'linux', '9e9c1cd67b4afedcae0dceaa3ad1029f', 'Online', '1548969719', 'SuperPowerPC');

CREATE TABLE results (
	id int(6) NOT NULL auto_increment,
	ip varchar(15) NOT NULL,
	port varchar(15) NOT NULL,
	start varchar(13) NOT NULL,
	command varchar(255) NOT NULL,
	output text NOT NULL,
	end varchar(13) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE tasks(
	id int(6) NOT NULL auto_increment,
	cid int(6) NOT NULL,
	task varchar(255) NOT NULL,
	status varchar(2) NOT NULL,
	result text NOT NULL,
	PRIMARY KEY (id)
);
INSERT INTO `tasks` (`id`, `cid`, `task`, `status`, `result`) VALUES
(1, 1, 'env', '0', '');
