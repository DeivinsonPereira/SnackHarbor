package com.snackharbor.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.snackharbor.entities.enums.Status;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
@Entity
@Table(name = "tb_table")
public class CustomerTable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Status status;
	private Double total;
	
	@ManyToMany
	@JoinTable(name = "consumption_id",
				joinColumns = @JoinColumn(name = "table_id"),
				inverseJoinColumns = @JoinColumn(name = "product_id"))
	private List<Product> consumption = new ArrayList<>();
	
	@SuppressWarnings("unused")
	private void setConsumption(List<Product> consumption) {}
	
	
}
