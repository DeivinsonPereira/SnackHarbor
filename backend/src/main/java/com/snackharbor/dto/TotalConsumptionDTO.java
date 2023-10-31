package com.snackharbor.dto;

import java.util.ArrayList;
import java.util.List;

import com.snackharbor.entities.Order;
import com.snackharbor.entities.Product;
import com.snackharbor.entities.enums.Status;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor

public class TotalConsumptionDTO {

	private Long id;
	private Status status;

	private List<Order> orders = new ArrayList<>();
	
	public TotalConsumptionDTO(Long id, Status status) {
		this.id = id;
		this.status = status;
	}
	
	@SuppressWarnings("unused")
	private void setOrders(List<Product> orders) {}
	
}
