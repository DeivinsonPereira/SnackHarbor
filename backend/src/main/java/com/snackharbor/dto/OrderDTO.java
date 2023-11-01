package com.snackharbor.dto;

import com.snackharbor.entities.Order;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderDTO {

	private Long id;
	private Long tableId;
	private ProductDTO product;
	
	public OrderDTO(Order entity) {
        this.id = entity.getId();
        if (entity.getTable() != null) {
            this.tableId = entity.getTable().getId();
        }
        if (entity.getProduct() != null) {
            this.product = new ProductDTO(entity.getProduct().getId(), entity.getProduct().getName(), entity.getProduct().getPrice());
        }
    }
	
}
