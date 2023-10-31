package com.snackharbor.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.snackharbor.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Long>{

}
