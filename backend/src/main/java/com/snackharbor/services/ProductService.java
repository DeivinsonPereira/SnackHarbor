package com.snackharbor.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snackharbor.dto.ProductDTO;
import com.snackharbor.entities.Product;
import com.snackharbor.repositories.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository repository;
	
	@Transactional(readOnly = true)
	public List<ProductDTO> getProductByCategoryId(Long categoryId) {
		try {
			if(categoryId != null) {
			List<Product> products = repository.findByCategoryId(categoryId);
			List<ProductDTO> productDTOs = new ArrayList<>();
			
			for (Product product : products) {
	            productDTOs.add(new ProductDTO(product));
	        }
			return productDTOs;
			
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}	
}
