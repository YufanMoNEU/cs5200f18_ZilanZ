USE `relational_model`;

DROP TABLE IF EXISTS `WebsitePriviledge`;
DROP TABLE IF EXISTS `PagePriviledge`;
DROP TABLE IF EXISTS `WebsiteRole`;
DROP TABLE IF EXISTS `PageRole`;
DROP TABLE IF EXISTS `Phone`;
DROP TABLE IF EXISTS `Address`;
DROP TABLE IF EXISTS `Widget`;
DROP TABLE IF EXISTS `Page`;
DROP TABLE IF EXISTS `Website`;
DROP TABLE IF EXISTS `Developer`;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS `Person`;
DROP TABLE IF EXISTS `Role`;
DROP TABLE IF EXISTS `Priviledge`;

CREATE TABLE `Person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Developer` (
  `personId` int NOT NULL,
  `developerKey` varchar(20) NOT NULL,
  PRIMARY KEY (`personId`),
	CONSTRAINT developer_person_generalization
		FOREIGN KEY (`personId`)
		REFERENCES Person(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `User` (
  `personId` int NOT NULL,
	`userAgreement` tinyint(1) NOT NULL,
  PRIMARY KEY (`personId`),
	CONSTRAINT user_person_generalization
		FOREIGN KEY (`personId`)
		REFERENCES Person(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Website` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `visits` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `views` int NOT NULL,
  `websiteId` int NOT NULL COMMENT 'has',
  PRIMARY KEY (`id`),
  CONSTRAINT `page_website_composition` 
		FOREIGN KEY (`websiteId`) 
		REFERENCES `Website` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Widget` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
	`width` int DEFAULT NULL,
	`height` int DEFAULT NULL,
	`cssClass` varchar(255) DEFAULT NULL,
	`cssStyle` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
	`order` int NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT 'src, html',
  `size` int DEFAULT 2 COMMENT 'headingSize',
  `shareble` tinyint(1) DEFAULT 0 COMMENT 'Youtube',
	`expandable` tinyint(1) DEFAULT 0 COMMENT 'Youtube',
	`dType` varchar(20) NOT NULL COMMENT 'YouTube/Image/Heading/Html',
  `pageId` int NOT NULL COMMENT 'has',
  PRIMARY KEY (`id`),
  CONSTRAINT `widget_page_composition` 
		FOREIGN KEY (`pageId`) 
		REFERENCES `Page` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Phone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `personId` int NOT NULL COMMENT 'has',
  PRIMARY KEY (`id`),
  CONSTRAINT `phone_person_composition` 
		FOREIGN KEY (`personId`) 
		REFERENCES `Person` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street1` varchar(100) NOT NULL,
	`street2` varchar(100) DEFAULT NULL,
	`city` varchar(20) NOT NULL,
	`state` varchar(20) DEFAULT NULL,
	`zip` varchar(20) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `personId` int NOT NULL COMMENT 'has',
  PRIMARY KEY (`id`),
  CONSTRAINT `address_person_composition` 
		FOREIGN KEY (`personId`) 
		REFERENCES `Person` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Role`(
`id` varchar(20) NOT NULL DEFAULT '',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `Role` (`id`) VALUES ('owner');
INSERT INTO `Role` (`id`) VALUES ('admin');
INSERT INTO `Role` (`id`) VALUES ('writer');
INSERT INTO `Role` (`id`) VALUES ('editor');
INSERT INTO `Role` (`id`) VALUES ('reviewer');

CREATE TABLE `Priviledge`(
`id` varchar(20) NOT NULL DEFAULT '',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `Priviledge` (`id`) VALUES ('create');
INSERT INTO `Priviledge` (`id`) VALUES ('read');
INSERT INTO `Priviledge` (`id`) VALUES ('update');
INSERT INTO `Priviledge` (`id`) VALUES ('delete');

CREATE TABLE `WebsiteRole`(
`id` int NOT NULL AUTO_INCREMENT,
`role` varchar(20) NOT NULL DEFAULT '',
`developerId` int NOT NULL,
`websiteId` int NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `website_role_enums` 
	FOREIGN KEY (`role`) 
	REFERENCES `Role` (`id`),
CONSTRAINT `website_role_developer_association` 
	FOREIGN KEY (`developerId`) 
	REFERENCES `Developer` (`personId`),
CONSTRAINT `website_role_website_association` 
	FOREIGN KEY (`websiteId`) 
	REFERENCES `Website` (`id`)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PageRole`(
`id` int NOT NULL AUTO_INCREMENT,
`role` varchar(20) NOT NULL DEFAULT '',
`developerId` int NOT NULL,
`pageId` int NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `page_role_enums` 
	FOREIGN KEY (`role`) 
	REFERENCES `Role` (`id`),
CONSTRAINT `page_role_developer_association` 
	FOREIGN KEY (`developerId`) 
	REFERENCES `Developer` (`personId`),
CONSTRAINT `page_role_page_association` 
	FOREIGN KEY (`pageId`) 
	REFERENCES `Page` (`id`)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `WebsitePriviledge`(
`id` int NOT NULL AUTO_INCREMENT,
`priviledge` varchar(20) NOT NULL DEFAULT '',
`developerId` int NOT NULL,
`websiteId` int NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `website_priviledge_enums` 
	FOREIGN KEY (`priviledge`) 
	REFERENCES `Priviledge` (`id`),
CONSTRAINT `website_priviledge_developer_association` 
	FOREIGN KEY (`developerId`) 
	REFERENCES `Developer` (`personId`),
CONSTRAINT `website_priviledge_website_association` 
	FOREIGN KEY (`websiteId`) 
	REFERENCES `Website` (`id`)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PagePriviledge`(
`id` int NOT NULL AUTO_INCREMENT,
`priviledge` varchar(20) NOT NULL DEFAULT '',
`developerId` int NOT NULL,
`pageId` int NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `page_priviledge_enums` 
	FOREIGN KEY (`priviledge`) 
	REFERENCES `Priviledge` (`id`),
CONSTRAINT `page_priviledge_developer_association` 
	FOREIGN KEY (`developerId`) 
	REFERENCES `Developer` (`personId`),
CONSTRAINT `page_priviledge_page_association` 
	FOREIGN KEY (`pageId`) 
	REFERENCES `Page` (`id`)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
