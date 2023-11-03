package com.snackharbor.services;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snackharbor.dto.CustomerTableDTO;
import com.snackharbor.dto.UpdateStatusDTO;
import com.snackharbor.entities.CustomerTable;
import com.snackharbor.entities.Order;
import com.snackharbor.entities.Product;
import com.snackharbor.entities.enums.Status;
import com.snackharbor.repositories.CustomerTableRepository;
import com.snackharbor.repositories.OrderRepository;
import com.snackharbor.repositories.ProductRepository;
import com.snackharbor.services.exceptions.BusinessException;
import com.snackharbor.services.exceptions.ResourceNotFoundException;

@Service
public class CustomerTableService {

	@Autowired
	private CustomerTableRepository repository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	public List<CustomerTableDTO> totalConsumptionForAllTables() {
        List<CustomerTable> tables = repository.findAll();
        if(tables != null) {
        List<CustomerTableDTO> tableDTOs = new ArrayList<>();

        for (CustomerTable table : tables) {
            BigDecimal total = calculateTotal(table.getOrders());
            CustomerTableDTO tableDTO = new CustomerTableDTO(table, total);
            tableDTOs.add(tableDTO);
        }

        return tableDTOs;
        }else {
        	throw new ResourceNotFoundException("Tables not found!");
        }
        
    }
	
	
	
	@Transactional(readOnly=true)
	public CustomerTableDTO totalConsumption(Long id) {
        CustomerTable table = repository.findTableWithOrders(id);
        if (table == null) {
            throw new ResourceNotFoundException("Error: resource not found!");
        }
        BigDecimal total = calculateTotal(table.getOrders());
        return new CustomerTableDTO(table, total);
    
	}
	
	
	@Transactional
	public void addOrderToTable(Long tableId, Long productId) {
        CustomerTable table = repository.findById(tableId)
            .orElseThrow(() -> new ResourceNotFoundException("Table not found"));

        if (table.getStatus() == Status.OCCUPIED || table.getStatus() == Status.FREE) {
            Product product = productRepository.findById(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found"));

            Order order = new Order();
            order.setTable(table);
            order.setProduct(product);
            
            table.getOrders().add(order);
            
            if (table.getStatus() == Status.FREE) {
                table.setStatus(Status.OCCUPIED);
                repository.save(table);
            }

            orderRepository.save(order);
        
        }else {
				throw new BusinessException("Table is closed");
		}
    }
	
	@Transactional
	public UpdateStatusDTO updateStatus(Long tableId, UpdateStatusDTO dto) {
		try {
			CustomerTable entity = repository.getReferenceById(tableId);
			entity.setStatus(dto.getStatus());
			return new UpdateStatusDTO(entity);
		}catch (EntityNotFoundException e) {
			throw new ResourceNotFoundException("An unexpected error occurred.");
		}
		
	}
	
	
	private BigDecimal calculateTotal(List<Order> orders) {
        BigDecimal totalSum = BigDecimal.ZERO;
        for (Order order : orders) {
            totalSum = totalSum.add(order.getProduct().getPrice());
        }
        return totalSum;
    }
	
}
