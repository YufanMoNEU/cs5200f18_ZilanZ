package edu.northeastern.cs5200;

import edu.northeastern.cs5200.daos.RoleDao;
import org.junit.Test;

public class testRole extends JdbcAssignmentApplicationTests {

    RoleDao roleDao = RoleDao.getInstance();

    @Test
    public void testAssignWebsiteRole() {
        roleDao.assignWebsiteRole(34,345,2);
    }

    @Test
    public void testAssignPageRole() {
        roleDao.assignPageRole(34,345,3);
    }

    @Test
    public void testDeleteWebsiteRole() {
        roleDao.deleteWebsiteRole(34,345,2);
    }

    @Test
    public void testDeletePageRole() {
        roleDao.deletePageRole(34,345,3);
    }
}
