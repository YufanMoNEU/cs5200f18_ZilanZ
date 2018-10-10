USE `relational_model`;

-- 1a. Retrieve all developers
SELECT * FROM Person WHERE id IN (SELECT personId FROM Developer);

-- 1b. Retrieve a developer with id equal to 34 (charlie)
SELECT * FROM Person WHERE id IN (SELECT personId FROM Developer) AND id = 34;

-- 1c. Retrieve all developers who have a role in Twitter other than owner (charlie, alice)
SELECT * FROM Person WHERE 
id IN (SELECT a.personId FROM 
(SELECT * FROM Developer de JOIN WebsiteRole wr ON de.personId = wr.developerId) a 
WHERE a.websiteId IN (SELECT id FROM Website WHERE `name` = 'Twitter') AND a.role != 'owner');

-- 1d. Retrieve all developers who are page reviewers of pages with less than 300000 visits(charlie)
SELECT * FROM Person WHERE 
id IN (SELECT a.personId FROM 
(SELECT * FROM Developer de JOIN PageRole pr ON de.personId = pr.developerId) a 
WHERE a.pageId IN (SELECT id FROM Page WHERE views < 300000) AND a.role = 'reviewer' );

-- 1e. Retrieve the writer developer who added a heading widget to CNET's home page (charlie)
SELECT * FROM Person WHERE 
id IN (SELECT a.personId 
FROM (SELECT * FROM Developer de JOIN PageRole pr ON de.personId = pr.developerId) a WHERE
pageId IN (SELECT id FROM Page WHERE
websiteId IN (SELECT id FROM Website WHERE `name` = 'CNET')
AND id IN (SELECT pageId FROM Widget WHERE dType = 'heading')
AND title = 'Home')
AND role = 'writer');

-- 2a. Retrieve the website with the least number of visits
SELECT * FROM Website WHERE visits = (SELECT min(visits) FROM Website);

-- 2b. Retrieve the name of a website whose id is 678 (Gizmodo)
SELECT `name` FROM Website WHERE id = 678;

-- 2c. Retrieve all websites with videos reviewed by bob (CNN)
SELECT * FROM Website WHERE
id IN (SELECT a.websiteId FROM (SELECT websiteId, pageId, developerId, role
FROM PageRole pr JOIN Page p ON pr.pageId = p.id) a WHERE 
a.pageId IN (SELECT pageId FROM Widget WHERE dType = 'youtube')
AND a.developerId = (SELECT id FROM Person WHERE username = 'bob')
AND a.role = 'reviewer');

-- 2d. Retrieve all websites where alice is an owner (Facebook, )
SELECT * FROM Website WHERE
id IN(SELECT websiteId FROM WebsiteRole WHERE 
developerId = (SELECT id FROM Person WHERE `username` = 'alice')
AND role = 'owner');

-- 2e. Retrieve all websites where charlie is an admin and get more than 6000000 visits
SELECT * FROM Website WHERE
id IN (SELECT websiteId FROM WebsiteRole WHERE 
developerId = (SELECT id FROM Person WHERE `username` = 'charlie')
AND role = 'admin') AND visits > 6000000;

-- 3a. Retrieve the page with the most number of views
SELECT * FROM Page WHERE views = (SELECT max(views) FROM Page);

-- 3b. Retrieve the title of a page whose id is 234
SELECT title FROM Page WHERE id = 234;

-- 3c. Retrieve all pages where alice is an editor (About)
SELECT * FROM Page WHERE
id IN (SELECT pageId FROM PageRole WHERE 
developerId = (SELECT id FROM Person WHERE username = 'alice')
AND role = 'editor');

-- 3d. Retrieve the total number of pageviews in CNET
SELECT SUM(views) FROM Page WHERE
websiteId = (SELECT id FROM Website WHERE `name`='CNET');

-- 3e. Retrieve the average number of page views in the Web site Wikipedia
SELECT AVE(views) FROM Page WHERE
websiteId = (SELECT id FROM Website WHERE `name`='Wikipedia');

-- 4a. Retrieve all widgets in CNET's Home page
SELECT * FROM Widget WHERE 
pageId IN (SELECT id FROM Page WHERE title = 'Home' 
AND websiteId = (SELECT id FROM Website WHERE `name` = 'CNET'));

-- 4b. Retrieve all youtube widgets in CNN
SELECT * FROM Widget WHERE
pageId IN (SELECT a. id FROM 
(SELECT p.id, w.`name` FROM Page p JOIN Website w ON w.id = p.websiteId) a
WHERE a.`name` = 'CNN')
AND dType = 'youtube';

-- 4c. Retrieve all image widgets on pages reviewed by Alice
SELECT * FROM Widget WHERE
pageId IN (SELECT pageId FROM PageRole WHERE
developerId = (SELECT id FROM Person WHERE username = 'alice')
AND role = 'reviewer')
AND dType = 'image';

-- 4d. Retrieve how many widgets are in Wikipedia
SELECT COUNT(id) FROM Widget WHERE
pageId IN (SELECT a. id FROM 
(SELECT p.id, w.`name` FROM Page p JOIN Website w ON w.id = p.websiteId) a
WHERE a.`name` = 'Wikipedia')

-- 5a. Retrieve the names of all the websites where Bob has DELETE privileges.
-- Answer: Twitter, Wikipedia, CNET, Gizmodo (where Bob has either owner or admin roles).
SELECT `name` FROM Website WHERE
id IN (SELECT websiteId FROM WebsitePriviledge 
WHERE priviledge = 'delete'
AND developerId = (SELECT id FROM Person WHERE username = 'bob'))

-- 5b. Retrieve the names of all the pages where Charlie has CREATE privileges.
-- Answer: Home, Preferences (where Charlie has Writer role)
SELECT title FROM Page WHERE
id IN (SELECT pageId FROM PagePriviledge 
WHERE priviledge = 'create'
AND developerId = (SELECT id FROM Person WHERE username = 'charlie'))
