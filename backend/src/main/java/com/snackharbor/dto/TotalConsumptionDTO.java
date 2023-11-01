package com.snackharbor.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.snackharbor.entities.CustomerTable;
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
	private BigDecimal total;
	
	private List<OrderDTO> orders;
	
	public TotalConsumptionDTO (Long id, Status status, BigDecimal total) {
		this.id = id;
		this.status = status;
		this.total = total;
	}
	
	public TotalConsumptionDTO (CustomerTable entity, BigDecimal totalValue) {
		this.id = entity.getId();
		this.status = entity.getStatus();
		this.total = totalValue;
		this.orders = new ArrayList<>();
		
		for (Order order : entity.getOrders()) {
	        this.orders.add(new OrderDTO(order));
	    }
	
	}
	
	@SuppressWarnings("unused")
	private void setOrders(List<Product> orders) {}
	
	
}
