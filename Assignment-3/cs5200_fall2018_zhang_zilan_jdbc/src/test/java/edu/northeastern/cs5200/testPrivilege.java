package edu.northeastern.cs5200;

import edu.northeastern.cs5200.daos.PrivilegeDao;
import edu.northeastern.cs5200.daos.RoleDao;
import edu.northeastern.cs5200.models.Privilege;
import org.junit.Test;

public class testPrivilege extends JdbcAssignmentApplicationTests {

    PrivilegeDao privilegeDao = PrivilegeDao.getInstance();

    @Test
    public void testAssignWebsiteRole() {
        privilegeDao.assignWebsitePrivilege(34,345,"create");
    }

    @Test
    public void testAssignPagePrivilege() {
        privilegeDao.assignPagePrivilege(34,345, "read");
    }

    @Test
    public void testDeleteWebsitePrivilege() {
        privilegeDao.deleteWebsitePrivilege(34,345,"create");
    }

    @Test
    public void testDeletePagePrivilege() {
        privilegeDao.deletePagePrivilege(34, 345, "create");
    }
}
