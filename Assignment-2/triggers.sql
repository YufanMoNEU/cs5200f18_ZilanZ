USE `relational_model`;

DROP TRIGGER IF EXISTS `after_websiteRole_insert`;
DROP TRIGGER IF EXISTS `after_websiteRole_update`;
DROP TRIGGER IF EXISTS `after_websiteRole_delete`;
DROP TRIGGER IF EXISTS `after_pageRole_insert`;
DROP TRIGGER IF EXISTS `after_pageRole_update`;
DROP TRIGGER IF EXISTS `after_pageRole_delete`;

CREATE TRIGGER `after_websiteRole_insert`
	AFTER INSERT ON `WebsiteRole`
	FOR EACH ROW
BEGIN
	INSERT INTO WebsitePriviledge (priviledge, developerId, websiteId) 
	VALUES ('read', new.developerId, new.websiteId);
	IF new.role = 'owner' OR new.role = 'admin' THEN
		INSERT INTO WebsitePriviledge (priviledge, developerId, websiteId) 
		VALUES ('create', new.developerId, new.websiteId), ('update', new.developerId, new.websiteId), ('delete', new.developerId, new.websiteId);
	ELSEIF new.role = 'writer' THEN
		INSERT INTO WebsitePriviledge (priviledge, developerId, websiteId) 
		VALUES ('create', new.developerId, new.websiteId), ('update', new.developerId, new.websiteId);
	ELSEIF new.role = 'editor' THEN
		INSERT INTO WebsitePriviledge (priviledge, developerId, websiteId) 
		VALUES ('update', new.developerId, new.websiteId);
	END IF;
END;

CREATE TRIGGER `after_websiteRole_update`
	AFTER UPDATE ON `WebsiteRole`
	FOR EACH ROW
BEGIN
	IF new.role != old.role THEN
		DELETE FROM WebsitePriviledge WHERE developerId = old.developerId AND websiteId = old.websiteId;
		INSERT INTO WebsitePriviledge (priviledge, developerId, websiteId) 
		VALUES ('read', new.developerId, new.websiteId);
		IF new.role = 'owner' OR 'admin' THEN
			INSERT INTO WebsitePriviledge (priviledge, developerId, websiteId) 
			VALUES ('create', new.developerId, new.websiteId), ('update', new.developerId, new.websiteId), ('delete', new.developerId, new.websiteId);
		ELSEIF new.role = 'writer' THEN
			INSERT INTO WebsitePriviledge (priviledge, developerId, websiteId) 
			VALUES ('create', new.developerId, new.websiteId), ('update', new.developerId, new.websiteId);
		ELSEIF new.role = 'editor' THEN
			INSERT INTO WebsitePriviledge (priviledge, developerId, websiteId) 
			VALUES ('update', new.developerId, new.websiteId);
		END IF;
	ELSE
		UPDATE WebsitePriviledge SET developerId = new.developerId AND websiteId = new.websiteId;
	END IF;
END;

CREATE TRIGGER `after_websiteRole_delete`
	AFTER DELETE ON `WebsiteRole`
	FOR EACH ROW
BEGIN
		DELETE FROM WebsitePriviledge WHERE developerId = old.developerId AND websiteId = old.websiteId;
END;

CREATE TRIGGER `after_pageRole_insert`
	AFTER INSERT ON `PageRole`
	FOR EACH ROW
BEGIN
	INSERT INTO PagePriviledge (priviledge, developerId, pageId) 
	VALUES ('read', new.developerId, new.pageId);
	IF new.role = 'owner' OR 'admin' THEN
		INSERT INTO PagePriviledge (priviledge, developerId, pageId) 
		VALUES ('create', new.developerId, new.pageId), ('update', new.developerId, new.pageId), ('delete', new.developerId, new.pageId);
	ELSEIF new.role = 'writer' THEN
		INSERT INTO PagePriviledge (priviledge, developerId, pageId) 
		VALUES ('create', new.developerId, new.pageId), ('update', new.developerId, new.pageId);
	ELSEIF new.role = 'editor' THEN
		INSERT INTO PagePriviledge (priviledge, developerId, pageId) 
		VALUES ('update', new.developerId, new.pageId);
	END IF;
END;

CREATE TRIGGER `after_pageRole_update`
	AFTER UPDATE ON `PageRole`
	FOR EACH ROW
BEGIN
	IF new.role != old.role THEN
		DELETE FROM PagePriviledge WHERE developerId = old.developerId AND pageId = old.pageId;
		INSERT INTO PagePriviledge (priviledge, developerId, pageId) 
		VALUES ('read', new.developerId, new.pageId);
		IF new.role = 'owner' OR 'admin' THEN
			INSERT INTO PagePriviledge (priviledge, developerId, pageId) 
			VALUES ('create', new.developerId, new.pageId), ('update', new.developerId, new.pageId), ('delete', new.developerId, new.pageId);
		ELSEIF new.role = 'writer' THEN
			INSERT INTO PagePriviledge (priviledge, developerId, pageId) 
			VALUES ('create', new.developerId, new.pageId), ('update', new.developerId, new.pageId);
		ELSEIF new.role = 'editor' THEN
			INSERT INTO PagePriviledge (priviledge, developerId, pageId) 
			VALUES ('update', new.developerId, new.pageId);
		END IF;
	ELSE
		UPDATE PagePriviledge SET developerId = new.developerId AND pageId = new.pageId;
	END IF;
END;

CREATE TRIGGER `after_pageRole_delete`
	AFTER DELETE ON `PageRole`
	FOR EACH ROW
BEGIN
		DELETE FROM PagePriviledge WHERE developerId = old.developerId AND websiteId = old.pageId;
END;
