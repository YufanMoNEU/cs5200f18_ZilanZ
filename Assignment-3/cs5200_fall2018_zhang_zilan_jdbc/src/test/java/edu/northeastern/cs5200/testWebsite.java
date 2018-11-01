package edu.northeastern.cs5200;

import edu.northeastern.cs5200.daos.WebsiteDao;
import edu.northeastern.cs5200.models.Website;
import org.junit.Test;

import java.util.Collection;
import java.util.Date;

public class testWebsite extends JdbcAssignmentApplicationTests {

    @Test
    public void testCreateWebsite() {
        WebsiteDao dao = WebsiteDao.getInstance();
        Website website = new Website(345, "Wikipedia", "a free online encyclopedia", new Date(), new Date(), 3456654);
        dao.createWebsiteForDeveloper(34, website);
    }

    @Test
    public void testFindAllWebsite() {
        WebsiteDao dao = WebsiteDao.getInstance();
        Collection<Website> websites = dao.findAllWebsites();
    }

    @Test
    public void testFindWebsitesForDeveloper() {
        WebsiteDao dao = WebsiteDao.getInstance();
        Collection<Website> websites = dao.findWebsitesForDeveloper(34);
    }

    @Test
    public void testFindWebsiteById() {
        WebsiteDao dao = WebsiteDao.getInstance();
        Website website = dao.findWebsiteById(345);
    }

    @Test
    public void testUpdateWebsite() {
        WebsiteDao dao = WebsiteDao.getInstance();
        Website website = new Website(345, "Wikipedia-change", "a free online encyclopedia", null, new Date(), 3456654);
        int result = dao.updateWebsite(345, website);
    }

    @Test
    public void testDeleteWebsite() {
        WebsiteDao dao = WebsiteDao.getInstance();
        int result = dao.deleteWebsite(345);
    }
}
