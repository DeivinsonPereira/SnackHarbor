package com.snackharbor.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.snackharbor.entities.CustomerTable;

public interface CustomerTableRepository extends JpaRepository<CustomerTable, Long> {

}
