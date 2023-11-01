package com.snackharbor.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
	
	@OneToMany(mappedBy = "table", fetch = FetchType.EAGER)
	private List<Order> orders = new ArrayList<>();
	
	@SuppressWarnings("unused")
	private void setOrders(List<Order> orders) {}
	
	
}
