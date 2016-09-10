package com.app.pojo;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Company")
public class Company implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private String expertise;
	private Date start;
	private Date end;
	private String location;
	private User user;
	private Integer capacity;

	public Company() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue (strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getExpertise() {
		return expertise;
	}

	public void setExpertise(String expertise) {
		this.expertise = expertise;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@ManyToOne( fetch = FetchType.LAZY, cascade = CascadeType.ALL )
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public Company(int id, String expertise, Date start, Date end,
			String location, User user, Integer capacity) {
		super();
		this.id = id;
		this.expertise = expertise;
		this.start = start;
		this.end = end;
		this.location = location;
		this.user = user;
		this.capacity = capacity;
	}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;

        if (o == null || getClass() != o.getClass()) return false;

        Company company = (Company) o;

        return new EqualsBuilder()
                .append(id, company.id)
                .append(expertise, company.expertise)
                .append(start, company.start)
                .append(end, company.end)
                .append(location, company.location)
                .append(user, company.user)
                .append(capacity, company.capacity)
                .isEquals();
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder(17, 37)
                .append(id)
                .append(expertise)
                .append(start)
                .append(end)
                .append(location)
                .append(user)
                .append(capacity)
                .toHashCode();
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this)
                .append("id", id)
                .append("expertise", expertise)
                .append("start", start)
                .append("end", end)
                .append("location", location)
                .append("user", user)
                .append("capacity", capacity)
                .toString();
    }
}