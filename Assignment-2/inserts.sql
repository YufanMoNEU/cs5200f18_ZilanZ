USE `relational_model`;

INSERT INTO `Person`
(`id`, `username`, `password`, `firstName`, `lastName`, `email`)
VALUES
(12, 'alice', 'alice', 'Alice', 'Wonder', 'alice@wonder.com'),
(23, 'bob', 'bob', 'Bob', 'Marley', 'bob@marley.com'),
(34, 'charlie', 'charlie', 'Charlie', 'Garcia', 'chuch@garcia.com'),
(45, 'dan', 'dan', 'Dan', 'Martin', 'dan@martin.com'),
(56, 'ed', 'ed', 'Ed', 'Karaz', 'ed@kar.com');

INSERT INTO `Developer`
(`personId`, `developerKey`)
VALUES (12, '4321rewq'), (23, '5432trew'), (34, '6543erty');

INSERT INTO `User`
(`personId`, `userAgreement`)
VALUES (45, 1), (56, 0);

INSERT INTO `Website`
(`id`, `name`, `description`, `created`, `updated`, `visits`)
VALUES
(123, 'Facebook', 'an online social media and social networking service', CURDATE(), CURDATE(), 1234234),
(234, 'Twitter', 'an online news and social networking service', CURDATE(), CURDATE(), 4321543),
(345, 'Wikipedia', 'a free online encyclopedia', CURDATE(), CURDATE(), 3456654),
(456, 'CNN', 'an American basic cable and satellite television news channel', CURDATE(), CURDATE(), 6543345),
(567, 'CNET', 'an American media website that publishes reviews, news, articles, blogs, podcasts and videos on technology and consumer electronics', CURDATE(), CURDATE(), 5433455),
(678, 'Gizmodo', 'a design, technology, science and science fiction website that also writes articles on politics', CURDATE(), CURDATE(), 4322345);

INSERT INTO `WebsiteRole`
(`role`,`developerId`,`websiteId`)
VALUES
('owner', 12, 123), ('editor', 23, 123), ('admin', 34, 123),
('owner', 23, 234), ('editor', 34, 234), ('admin', 12, 234),
('owner', 34, 345), ('editor', 12, 345), ('admin', 23, 345),
('owner', 12, 456), ('editor', 23, 456), ('admin', 34, 456),
('owner', 23, 567), ('editor', 34, 567), ('admin', 12, 567),
('owner', 34, 678), ('editor', 12, 678), ('admin', 23, 678);

INSERT INTO `Page`
(`id`, `title`, `description`, `created`, `updated`, `views`, `websiteId`)
VALUES
(123, 'Home', 'Landing page', '2018-09-05', '2018-10-08', 123434, 567),
(234, 'About', 'Website Description', '2018-09-05', '2018-10-08', 234545, 678),
(345, 'Contact', 'Addresses, phones, and contact info', '2018-09-05', '2018-10-08', 345656, 345),
(456, 'Preferences', 'Where users can configure their preferences', '2018-09-05', '2018-10-08', 456776, 456),
(567, 'Profile', 'Users can configure their personal information', '2018-09-05', '2018-10-08', 567878, 567);

INSERT INTO `PageRole`
(`role`,`developerId`,`pageId`)
VALUES
('editor',12,123),('reviewer',23,123),('writer',34,123),
('editor',23,234),('reviewer',34,234),('writer',12,234),
('editor',34,345),('reviewer',12,345),('writer',23,345),
('editor',12,456),('reviewer',23,456),('writer',34,456),
('editor',23,567),('reviewer',34,567),('writer',12,567);

INSERT INTO `Widget`
(`id`,`name`,`dType`,`text`,`order`,`width`,`height`,`url`,`pageId`)
VALUES
(123,'head123','heading','Welcome',0,null,null,null,123),
(234,'post234','html','<p>Lorem</p>',0,null,null,null,234),
(345,'head345','heading','Hi',1,null,null,null,345),
(456,'intro456','html','<h1>Hi</h1>',2,null,null,null,345),
(567,'image345','image',null,3,50,100,'/img/567.png',345),
(678,'video456','youtube',null,0,400,300,'https://youtu.be/h67VX51QXiQ',456);

INSERT INTO `Phone`
(`phone`,`primary`,`personId`)
VALUES
('123-234-3456',1,12),('234-345-4566',0,12),('345-456-5677',1,23),
('321-432-5435',1,34),('432-432-5433',0,34),('543-543-6544',0,34);

INSERT INTO `Address`
(`street1`,`city`,`zip`,`primary`,`personId`)
VALUES
('123 Adam St.','Alton','01234',1,12),
('234 Birch St.','Boston','02345',0,12),
('345 Charles St.','Chelms','03455',1,23),
('456 Down St.','Dalton','04566',0,23),
('543 East St.','Everett','01112',0,23),
('654 Frank St.','Foulton','04322',1,34);
