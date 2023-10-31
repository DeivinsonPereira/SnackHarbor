package com.snackharbor.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.snackharbor.entities.Product;

public interface ProductRepository extends JpaRepository<Product, Long>{

}
