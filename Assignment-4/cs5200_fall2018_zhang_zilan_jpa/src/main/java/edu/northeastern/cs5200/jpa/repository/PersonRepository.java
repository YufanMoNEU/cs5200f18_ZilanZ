package edu.northeastern.cs5200.jpa.repository;

import edu.northeastern.cs5200.jpa.entity.Person;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface PersonRepository extends CrudRepository<Person, Integer> {

    //Create my own
    @Query("SELECT person FROM Person person WHERE person.username=:username")
    public Person findPersonByUsername(@Param("username") String username);

    @Query("SELECT person FROM Person person WHERE person.username=:username AND person.password=:password")
    public Person findPersonByCredentials(@Param("username") String username, @Param("password") String password);

}
