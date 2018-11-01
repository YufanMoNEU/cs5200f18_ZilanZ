package edu.northeastern.cs5200;

import edu.northeastern.cs5200.daos.DeveloperDao;
import edu.northeastern.cs5200.models.Address;
import edu.northeastern.cs5200.models.Developer;
import edu.northeastern.cs5200.models.Phone;
import org.junit.Test;

import java.util.Collection;
import java.util.Date;

public class testDeveloper extends JdbcAssignmentApplicationTests{

    @Test
    public void testCreateDeveloper() {
        DeveloperDao dao = DeveloperDao.getInstance();
        Developer developer = new Developer(34, "Charlie", "Garcia", "charlie", "charlie",
                "chuch@garcia.com", null,"6543erty");
        Phone phone1 = new Phone("321-432-5435", true, developer);
        Phone phone2 = new Phone("432-432-5433", false, developer);
        Phone phone3 = new Phone("543-543-6544", false, developer);
        developer.addPhone(phone1);
        developer.addPhone(phone2);
        developer.addPhone(phone3);
        Address address = new Address("654 Frank St.",null,"Foulton", "MA","04322",true, developer);
        developer.addAddress(address);
        dao.updateDeveloper(developer.getId(), developer);
    }

    @Test
    public void testFindAllDevelopers() {
        DeveloperDao dao = DeveloperDao.getInstance();
        Collection<Developer> developers = dao.findAllDevelopers();
    }

    @Test
    public void testFindDeveloperById() {
        DeveloperDao dao = DeveloperDao.getInstance();
        Developer developer = dao.findDeveloperById(34);
    }

    @Test
    public void testFindDeveloperByUsername() {
        DeveloperDao dao = DeveloperDao.getInstance();
        Developer developer = dao.findDeveloperByUsername("charlie");
    }

    @Test
    public void testFindDeveloperByCredentials() {
        DeveloperDao dao = DeveloperDao.getInstance();
        Developer developer = dao.findDeveloperByCredentials("charlie", "charlie");
    }

    @Test
    public void testUpdateDeveloper() {
        DeveloperDao dao = DeveloperDao.getInstance();
        Developer developer = new Developer(34, "Cat", "Garcia", "charlie", "charlie",
                "chuch@garcia.com", new Date(),"6543erty");
        Phone phone1 = new Phone("321-432-5435", true, developer);
        Phone phone2 = new Phone("432-432-5433", false, developer);
        Phone phone3 = new Phone("543-543-6544", false, developer);
        developer.addPhone(phone1);
        developer.addPhone(phone2);
        developer.addPhone(phone3);
        Address address = new Address("654 Frank St.",null,"Foulton", "MA","04322",true,developer);
        developer.addAddress(address);
        int result = dao.updateDeveloper(34, developer);
    }

    @Test
    public void testDeleteDeveloper() {
        DeveloperDao dao = DeveloperDao.getInstance();
        int result = dao.deleteDeveloper(34);
    }
}
