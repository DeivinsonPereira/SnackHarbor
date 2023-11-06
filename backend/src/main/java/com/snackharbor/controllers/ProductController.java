package com.snackharbor.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.snackharbor.dto.ProductDTO;
import com.snackharbor.services.ProductService;

@RestController
@RequestMapping(value = "/products")
public class ProductController {

	@Autowired
	private ProductService service;
	
	@GetMapping(value = "/category/{categoryId}")
	public ResponseEntity<List<ProductDTO>> getProductsByCategoryId(@PathVariable Long categoryId){
		List<ProductDTO> products = service.getProductByCategoryId(categoryId);
		return ResponseEntity.ok().body(products);
	}
}
