package com.snackharbor.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.snackharbor.dto.TotalConsumptionDTO;
import com.snackharbor.services.CustomerTableService;

@RestController
@RequestMapping("/tables")
public class CustomerTableController {

	@Autowired
    private CustomerTableService calculationService;

	@GetMapping("/{tableId}/total")
    public ResponseEntity<TotalConsumptionDTO> totalConsumption(@PathVariable Long tableId) {
        TotalConsumptionDTO totalDTO = calculationService.totalConsumption(tableId);

        if (totalDTO != null) {
            return ResponseEntity.ok(totalDTO);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
