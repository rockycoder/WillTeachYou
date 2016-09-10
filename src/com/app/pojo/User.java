package com.app.pojo;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "User")
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String email;
	private String mobile;
	private String password;
	private String name;
	private int age;
	private List<Tutor> tutors;
	private List<Company> companies;
	private List<Volunteer> volunteers;
	private List<Student> students;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Id
    @GeneratedValue( strategy = GenerationType.AUTO )
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	public List<Tutor> getTutors() {
		return tutors;
	}

	public void setTutors(List<Tutor> tutors) {
		this.tutors = tutors;
	}
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	public List<Company> getCompanies() {
		return companies;
	}

	public void setCompanies(List<Company> companies) {
		this.companies = companies;
	}
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	public List<Volunteer> getVolunteers() {
		return volunteers;
	}

	public void setVolunteers(List<Volunteer> volunteers) {
		this.volunteers = volunteers;
	}

	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public User(int id, String email, String mobile, String password,
			String name, int age, List<Tutor> tutors, List<Company> companies,
			List<Volunteer> volunteers, List<Student> students) {
		super();
		this.id = id;
		this.email = email;
		this.mobile = mobile;
		this.password = password;
		this.name = name;
		this.age = age;
		this.tutors = tutors;
		this.companies = companies;
		this.volunteers = volunteers;
		this.students = students;
	}

}