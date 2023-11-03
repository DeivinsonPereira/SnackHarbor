package com.snackharbor.dto;

import java.util.ArrayList;
import java.util.List;

import com.snackharbor.entities.Category;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDTO {
	
	private Long id;
	private String name;
	private String imgUrl;
	
	private List<ProductDTO> products = new ArrayList<>();
	
	public CategoryDTO(Category entity) {
		this.id = entity.getId();
		this.name = entity.getName();
		this.imgUrl = entity.getImgUrl();	
		entity.getProducts().forEach(product -> this.products.add(new ProductDTO(product)));
	}
}
