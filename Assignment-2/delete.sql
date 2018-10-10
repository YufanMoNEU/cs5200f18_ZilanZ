-- 1. Delete Alice's primary address
DELETE FROM Address WHERE `primary` = 1 AND
personId = (SELECT id FROM Person WHERE username = 'alice');

-- 2. Remove the last widget in the Contact page. The last widget is the one with the highest value in the order field
SELECT @TMP := MAX(`order`) FROM Widget WHERE pageId = (SELECT id FROM Page WHERE title = 'Contact');
DELETE FROM Widget WHERE `order` = @TMP AND pageId = (SELECT id FROM Page WHERE title = 'Contact');

-- 3. Remove the last updated page in Wikipedia
SELECT @TMP1 := updated FROM Page ORDER BY updated DESC LIMIT 1;
DELETE FROM Page WHERE updated = @TMP1;

-- 4. Remove the CNET web site, as well as all related roles and privileges relating developers to the Website and Pages
DELETE FROM Website WHERE `name` = 'CNET';
