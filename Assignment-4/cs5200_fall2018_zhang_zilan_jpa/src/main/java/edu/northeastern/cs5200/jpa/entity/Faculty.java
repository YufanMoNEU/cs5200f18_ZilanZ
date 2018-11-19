package edu.northeastern.cs5200.jpa.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Faculty extends Person {
    private String office;
    private boolean tenured;

    @OneToMany(mappedBy = "author", fetch = FetchType.EAGER)
    private List<Course> authoredCourses = new ArrayList<>();

    public Faculty() {
    }

    public Faculty(String username, String password, String firstName, String lastName) {
        super(username, password, firstName, lastName);
    }

    public Faculty(String username, String password, String firstName, String lastName, String office, boolean tenured) {
        super(username, password, firstName, lastName);
        this.office = office;
        this.tenured = tenured;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }

    public boolean isTenured() {
        return tenured;
    }

    public void setTenured(boolean tenured) {
        this.tenured = tenured;
    }

    public List<Course> getAuthoredCourses() {
        return authoredCourses;
    }

    public void setAuthoredCourses(List<Course> authoredCourses) {
        this.authoredCourses = authoredCourses;
    }

    public void authoredCourse(Course course) {
        this.authoredCourses.add(course);
        if (course.getAuthor() != this) {
            course.setAuthor(this);
        }
    }
}
