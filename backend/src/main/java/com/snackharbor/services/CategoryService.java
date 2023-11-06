package com.snackharbor.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snackharbor.dto.CategoryDTO;
import com.snackharbor.entities.Category;
import com.snackharbor.repositories.CategoryRepository;
import com.snackharbor.services.exceptions.ResourceNotFoundException;

@Service
public class CategoryService {

	@Autowired
	private CategoryRepository repository;
	
	@Transactional(readOnly = true)
	public List<CategoryDTO> findAllCategory() {
		List<Category> categories = repository.findAll();
		if(categories == null) {
			throw new ResourceNotFoundException("Categories not found!");
		}else {

	        return categories.stream().map(x -> new CategoryDTO(x)).toList() ;
		}
			
	}
	
	@Transactional(readOnly=true)
	public CategoryDTO findById(Long id) {
		Category dto = repository.findById(id).
				orElseThrow(() -> new ResourceNotFoundException("Category not found!"));
		
		return new CategoryDTO(dto);
		
	}
}
