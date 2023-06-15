package com.example.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.example.validator.BirthDay;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "users")
@EntityListeners(AuditingEntityListener.class)
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "UUID")
	@GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator", parameters = {
			@Parameter(name = "uuid_gen_strategy_class", value = "org.hibernate.id.uuid.CustomVersionOneStrategy") })
	@Column(name = "id")
	private String id;

	@Email(message = "{email.email}")
	@NotBlank(message = "{notblank.email}")
	@Column(name = "email")
	private String email;

	@Column(name = "password")
	private String password = "KamarOnlineShopping@";

	@Size(min = 5, message = "{size.fullName}")
	@Column(name = "full_name")
	private String fullName;

	@BirthDay
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "birth_day")
	private Date birthDay;

	@Column(name = "address")
	private String address = null;
	
	@Column(name = "address_order")
	private String addressOrder = null;

	@Column(name = "gender")
	private boolean gender = false;

	@Column(name = "role")
	private boolean role = false;

	@Column(name = "login")
	private boolean login = true;

	@Column(name = "avatar")
	private String avatar = "noImageAvata.png";

	@CreatedDate
	@Column(name = "created_date", nullable = false, updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;

	@LastModifiedDate
	@Column(name = "last_modified_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastModifiedDate;

	@Column(name = "last_login_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastLoginDate = new Date();

	@JsonIgnore
	@OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<Brand> brandCreatedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "lastModifiedBy", cascade = CascadeType.ALL)
	private List<Brand> brandLastModifiedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<CategoryBlog> categoryBlogCreatedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "lastModifiedBy", cascade = CascadeType.ALL)
	private List<CategoryBlog> categoryBlogLastModifiedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<CategoryProduct> categoryProductCreatedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "lastModifiedBy", cascade = CascadeType.ALL)
	private List<CategoryProduct> categoryProductLastModifiedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<Color> colorCreatedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "lastModifiedBy", cascade = CascadeType.ALL)
	private List<Color> colorLastModifiedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<Product> productCreatedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "lastModifiedBy", cascade = CascadeType.ALL)
	private List<Product> productLastModifiedBy;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Like> likes;
}
