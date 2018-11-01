package edu.northeastern.cs5200;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class JdbcAssignmentApplicationTests {

    @Test
    public void contextLoads() {
        hw_jdbc_zhang_zilan test = new hw_jdbc_zhang_zilan();
        test.create();
        test.delete();
    }

}
