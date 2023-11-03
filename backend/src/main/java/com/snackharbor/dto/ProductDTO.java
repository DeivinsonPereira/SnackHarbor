package com.snackharbor.dto;

import java.math.BigDecimal;

import com.snackharbor.entities.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	
    private Long id;
    private String name;
    private String imgUrl;
    private BigDecimal price;
    

	public ProductDTO(Product entity) {
		this.id = entity.getId();
		this.name = entity.getName();
		this.imgUrl = entity.getImgUrl();
		this.price = entity.getPrice();
	}
    
    
    
    
}
