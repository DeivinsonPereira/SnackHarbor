package com.snackharbor.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.snackharbor.entities.Order;

public interface OrderRepository extends JpaRepository<Order, Long>{
	List<Order> findByTableId(Long tableId);
}
