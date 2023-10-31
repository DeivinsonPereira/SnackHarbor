package com.snackharbor.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.snackharbor.entities.Order;

public interface OrderRepository extends JpaRepository<Order, Long>{

}
