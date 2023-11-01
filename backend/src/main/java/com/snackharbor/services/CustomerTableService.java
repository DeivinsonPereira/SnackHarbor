package com.snackharbor.services;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snackharbor.dto.TotalConsumptionDTO;
import com.snackharbor.entities.CustomerTable;
import com.snackharbor.entities.Order;
import com.snackharbor.repositories.CustomerTableRepository;
import com.snackharbor.services.exceptions.NotFoundException;

@Service
public class CustomerTableService {

	@Autowired
	private CustomerTableRepository repository;
	
	@Transactional(readOnly=true)
	public TotalConsumptionDTO totalConsumption(Long id) {
        CustomerTable table = repository.findTableWithOrders(id);
        if (table == null) {
            throw new NotFoundException("Error: resource not found!");
        }
        BigDecimal total = calculateTotal(table.getOrders());
        return new TotalConsumptionDTO(table, total);
    
	}
	
	private BigDecimal calculateTotal(List<Order> orders) {
        BigDecimal totalSum = BigDecimal.ZERO;
        for (Order order : orders) {
            totalSum = totalSum.add(order.getProduct().getPrice());
        }
        return totalSum;
    }
	
}
