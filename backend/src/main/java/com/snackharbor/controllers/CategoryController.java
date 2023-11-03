package com.snackharbor.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.snackharbor.dto.CategoryDTO;
import com.snackharbor.services.CategoryService;

@RestController
@RequestMapping(value = "/categories")
public class CategoryController {

	@Autowired
	private CategoryService service;
	
	@GetMapping
	public ResponseEntity <List<CategoryDTO>> findAllCategory() {
		List<CategoryDTO> categories = service.findAllCategory();
		return ResponseEntity.ok(categories);
	}
}
