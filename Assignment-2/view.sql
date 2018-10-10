USE `relational_model`;

DROP VIEW IF EXISTS `developer_roles_and_priviledges`;

CREATE VIEW developer_roles_and_priviledges AS
SELECT
pd.firstName, pd.lastName, pd.username, pd.email,
a.`name` websiteName, a.visits, a.websitrUpdated, a.websiteRole, a.websitePriviledge,
a.title pageTitle, a.views, a.pageUpdated, a.pageRole, a.pagePriviledge
FROM
(SELECT * FROM Person pe JOIN Developer de ON pe.id = de.personId) pd
LEFT JOIN
(SELECT
wt.`name`, wt.visits, wt.updated websitrUpdated, wt.role websiteRole, wt.priviledge websitePriviledge,
pt.title, pt.views, pt.updated pageUpdated, pt.role pageRole, pt.priviledge pagePriviledge, wt.developerId
FROM
(SELECT
w.`name`, w.visits, w.updated, wtemp.role, wtemp.priviledge, wtemp.developerId, wtemp.websiteId
FROM Website w JOIN (SELECT 
wr.role, wp.priviledge, wr.developerId, wr.websiteId
FROM WebsiteRole wr INNER JOIN WebsitePriviledge wp ON wr.websiteId = wp.websiteId AND wr.developerId = wp.developerId) wtemp
ON w.id = wtemp.websiteId) wt
LEFT JOIN
(SELECT
p.title, p.views, p.updated, ptemp.role, ptemp.priviledge, ptemp.developerId, p.websiteId
FROM Page p JOIN (SELECT 
pr.role, pp.priviledge, pr.developerId, pr.pageId
FROM PageRole pr JOIN PagePriviledge pp ON pr.pageId = pp.pageId AND pr.developerId = pp.developerId) ptemp 
ON p.id = ptemp.pageId) pt
ON wt.websiteId = pt.websiteId AND wt.developerId = pt.developerId) a
ON pd.personId = a.developerId;
