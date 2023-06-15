package com.example.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.format.annotation.DateTimeFormat;

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
@Table(name = "products")
public class Product extends Auditable<User> {
	@Id
	@GeneratedValue(generator = "UUID")
	@GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator", parameters = {
			@Parameter(name = "uuid_gen_strategy_class", value = "org.hibernate.id.uuid.CustomVersionOneStrategy") })
	@Column(name = "id")
	private String id;

	@NotBlank(message = "{notblank.name}")
	@Column(name = "name")
	private String name;

	@Column(name = "price")
	private float price = 0;

	@Column(name = "discount")
	private float discount = 0;
	
	@Column(name = "start_day_discount")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDayDiscount;

//	@EndDayDiscount(before = "startDayDiscount", after= "endDayDiscount")
	@Column(name = "end_day_discount")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDayDiscount;

	@Column(name = "views")
	private int views = 0;

	@Column(name = "quantity")
	private int quantity = 0;

	@Column(name = "active")
	private boolean active = true;

	@Column(name = "description")
	private String description;

	@Column(name = "width")
	private float width = 0;

	@Column(name = "height")
	private float height = 0;

	@Column(name = "depth")
	private float depth = 0;

	@Column(name = "weight")
	private float weight = 0;
	
	@Column(name = "banner")
	private String banner = "noImage.png";

	@ManyToOne
	@JoinColumn(name = "id_brand")
	private Brand brand;

	@ManyToOne
	@JoinColumn(name = "id_category_product")
	private CategoryProduct categoryProduct;

	@ManyToOne
	@JoinColumn(name = "id_color")
	private Color color;

	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<ImageProduct> imageProducts;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<Review> reviews;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<Like> likes;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<OrderDetail> OrderDetail;
}
