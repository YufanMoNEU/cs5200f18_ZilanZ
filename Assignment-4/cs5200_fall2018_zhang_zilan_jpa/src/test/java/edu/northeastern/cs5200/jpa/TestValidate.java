package edu.northeastern.cs5200.jpa;

import edu.northeastern.cs5200.jpa.dao.UniversityDao;
import edu.northeastern.cs5200.jpa.dao.ValidateDao;
import edu.northeastern.cs5200.jpa.entity.*;
import edu.northeastern.cs5200.jpa.repository.EnrollmentRepository;
import edu.northeastern.cs5200.jpa.repository.StudentRepository;
import org.junit.Test;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TestValidate extends Cs5200Fall2018ZhangZilanJpaApplicationTests {

    @Autowired
    UniversityDao dao;

    //Validates uses - write a test that validates the total number of users
    @Test
    public void testValidateUsers() {
        List<Person> people = dao.findAllUsers();
        System.out.print("Total amount: ");
        System.out.println(people.size());
        for (Person person : people) {
            System.out.println(person.getUsername());
        }
    }

    // Validates faculty - write a test that validates the total number of faculty
    @Test
    public void testValidateFaculty() {
        List<Faculty> faculties = dao.findAllFaculty();
        System.out.print("Total amount: ");
        System.out.println(faculties.size());
        for (Faculty faculty : faculties) {
            System.out.println(faculty.getUsername());
        }
    }

    // Validates students - write a test that validates the total number of students
    @Test
    public void testValidateStudents() {
        List<Student> students = dao.findAllStudents();
        System.out.print("Total amount: ");
        System.out.println(students.size());
        for (Student student : students) {
            System.out.println(student.getUsername());
        }
    }

    // Validates courses - write a test that validates the total number of courses
    @Test
    public void testValidateCourses() {
        List<Course> courses = dao.findAllCourses();
        System.out.print("Total amount: ");
        System.out.println(courses.size());
        for (Course course : courses) {
            System.out.println(course.getLabel());
        }
    }

    // Validates sections - write a test that validates the total number of sections
    @Test
    public void testValidateSections() {
        List<Section> sections = dao.findAllSections();
        System.out.print("Total amount: ");
        System.out.println(sections.size());
        for (Section section : sections) {
            System.out.println(section.getTitle());
        }
    }

    // Validates Course authorship - write a test that validates the total number of courses authored by each faculty
    @Test
    public void testValidateAuthorship() {
        List<Faculty> faculties = dao.findAllFaculty();
        for (Faculty faculty : faculties) {
            System.out.print(faculty.getUsername() + ": ");
            List<Course> courses = dao.findCourseForAuthor(faculty);
            for (Course course : courses) {
                System.out.print(course.getLabel() + ' ');
            }
            System.out.println();
        }
    }

    // Validates Section per Course - write a test that validates the total number of sections per each course
    @Test
    public void testValidateSectionPerCourse() {
        List<Course> courses = dao.findAllCourses();
        for (Course course : courses) {
            System.out.print(course.getLabel() + ": ");
            List<Section> sections = dao.findSectionForCourse(course);
            for (Section section : sections) {
                System.out.print(section.getTitle() + ' ');
            }
            System.out.println();
        }
    }

    // Validates Section enrollments - write a test that validates the total number of students in each section
    @Test
    public void testSectionEnrollments() {
        List<Section> sections = dao.findAllSections();
        for (Section section : sections) {
            System.out.print(section.getTitle() + ": ");
            List<Student> students = dao.findStudentsInSection(section);
            for (Student student : students) {
                System.out.print(student.getUsername() + ' ');
            }
            System.out.println();
        }
    }

    @Autowired
    EnrollmentRepository enrollmentRepository;

    @Autowired
    StudentRepository studentRepository;

    @Test
    public void testFindEnrollmentsByStudent() {
        Student alice = studentRepository.findPersonByUsername("alice");
        List<Enrollment> enrollments = enrollmentRepository.findEnrollmentsByStudent(alice.getId());
        System.out.println(enrollments.size());

    }

    // Validates student enrollments - write a test that validates the total number of sections for each student
    @Test
    public void testStudentEnrollment() {
        List<Student> students = dao.findAllStudents();
        for (Student student : students) {
            System.out.print(student.getUsername() + ": ");
            List<Section> sections = dao.findSectionsForStudent(student);
            for (Section section : sections) {
                System.out.print(section.getTitle() + ' ');
            }
            System.out.println();
        }
    }

    // Validates Section seats - write a test that validates the number of section seats
    @Test
    public void testSectionSeats() {
        List<Section> sections = dao.findAllSections();
        for (Section section : sections) {
            System.out.println(section.getTitle() + ": " + section.getSeats());
        }
    }
}
