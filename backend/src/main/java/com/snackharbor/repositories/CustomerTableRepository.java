package com.snackharbor.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.snackharbor.entities.CustomerTable;

public interface CustomerTableRepository extends JpaRepository<CustomerTable, Long> {

	@Query("SELECT t FROM CustomerTable t "
			+ "LEFT JOIN FETCH t.orders o "
			+ "LEFT JOIN FETCH o.product "
			+ "WHERE t.id = :id ")
    CustomerTable findTableWithOrders(@Param("id") Long id);
}
