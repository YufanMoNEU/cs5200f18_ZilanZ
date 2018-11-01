package edu.northeastern.cs5200;

import edu.northeastern.cs5200.daos.PageDao;
import edu.northeastern.cs5200.daos.WebsiteDao;
import edu.northeastern.cs5200.models.Page;
import edu.northeastern.cs5200.models.Website;
import org.junit.Test;

import java.util.Collection;
import java.util.Date;

public class testPage extends JdbcAssignmentApplicationTests {

    PageDao dao = PageDao.getInstance();

    @Test
    public void testCreatePage() {
        Page page = new Page(345, "Contact", "Addresses, phones, and contact info", new Date(), null, 345656);
        dao.createPageForWebsite(345, page);
    }

    @Test
    public void testFindAllPage() {
        Collection<Page> pages = dao.findAllPages();
    }

    @Test
    public void testFindPageById() {
        Page page = dao.findPageById(345);
    }

    @Test
    public void testFindPagesForWebsite() {
        Collection<Page> pages = dao.findPagesForWebsite(345);
    }

    @Test
    public void testUpdatePage() {
        Page page = new Page(345, "Contact-change", "Addresses, phones, and contact info", new Date(), new Date(), 345656);
        WebsiteDao websiteDao = WebsiteDao.getInstance();
        Website website = websiteDao.findWebsiteById(345);
        page.setWebsite(website);
        int result = dao.updatePage(345, page);
    }

    @Test
    public void testDeletePage() {
        int result = dao.deletePage(345);
    }
}
