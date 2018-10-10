USE `relational_model`;

-- 1. Update Charlie's primary phone number to 333-444-5555
UPDATE Phone SET phone = '333-444-5555' WHERE 
personId = (SELECT id FROM Person WHERE username = 'charlie')
AND `primary` = 1;

-- 2. Update the relative order of widget head345 on the page so that it's new order is 3. 
-- Note that the other widget's order needs to update as well
UPDATE Widget SET `order` = 3 WHERE `name` = 'head345';
SELECT @TMP := pageId FROM Widget WHERE `name` = 'head345';
UPDATE Widget SET `order` = `order` + 2 WHERE 
`name` != 'head345' AND pageId = @TMP;

-- 3. Append 'CNET - ' to the beginning of all CNET's page titles
UPDATE Page SET title = CONCAT('CNET - ',title)
WHERE websiteId IN (SELECT id FROM Website WHERE `name` = 'CNET');

-- 4. Update roles - Swap Charlie's and Bob's role in CNET's Home page
SELECT @TMP1 := role FROM PageRole WHERE
pageId IN (SELECT id FROM Page WHERE (title = 'Home' OR title = 'CNET - Home') AND
websiteId = (SELECT id FROM Website WHERE `name` = 'CNET'))
AND developerId = (SELECT id FROM Person WHERE username = 'charlie');
SELECT @TMP2 := role FROM PageRole WHERE
pageId IN (SELECT id FROM Page WHERE (title = 'Home' OR title = 'CNET - Home') AND
websiteId = (SELECT id FROM Website WHERE `name` = 'CNET'))
AND developerId = (SELECT id FROM Person WHERE username = 'bob');
UPDATE PageRole SET role = @TMP2 WHERE
pageId IN (SELECT id FROM Page WHERE (title = 'Home' OR title = 'CNET - Home') AND
websiteId = (SELECT id FROM Website WHERE `name` = 'CNET'))
AND developerId = (SELECT id FROM Person WHERE username = 'charlie');
UPDATE PageRole SET role = @TMP1 WHERE
pageId IN (SELECT id FROM Page WHERE (title = 'Home' OR title = 'CNET - Home') AND
websiteId = (SELECT id FROM Website WHERE `name` = 'CNET'))
AND developerId = (SELECT id FROM Person WHERE username = 'bob');
