package com.snackharbor.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.snackharbor.dto.CustomerTableDTO;
import com.snackharbor.dto.UpdateStatusDTO;
import com.snackharbor.services.CustomerTableService;

@RestController
@RequestMapping("/tables")
public class CustomerTableController {

	@Autowired
    private CustomerTableService service;

	@GetMapping("/{tableId}/total")
    public ResponseEntity<CustomerTableDTO> totalConsumption(@PathVariable Long tableId) {
        CustomerTableDTO totalDTO = service.totalConsumption(tableId);

        if (totalDTO != null) {
            return ResponseEntity.ok(totalDTO);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
	
	
	@PostMapping("/{tableId}/add-order/{productId}")
    public ResponseEntity<Void> addOrderToTable(
    		@PathVariable Long tableId, 
    		@PathVariable Long productId) {
		service.addOrderToTable(tableId, productId);
        return ResponseEntity.ok().build();
    }
	
	@PatchMapping("/{tableId}/status")
    public ResponseEntity<UpdateStatusDTO> updateTableStatus(
    		@PathVariable Long tableId, 
    		@RequestBody UpdateStatusDTO dto) {
		service.updateStatus(tableId, dto);
		return ResponseEntity.ok().build();
	}
}
