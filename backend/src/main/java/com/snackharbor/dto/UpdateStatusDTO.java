package com.snackharbor.dto;

import com.snackharbor.entities.CustomerTable;
import com.snackharbor.entities.enums.Status;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UpdateStatusDTO {

	private Status status;
	
	public UpdateStatusDTO(CustomerTable entity) {
		this.status = entity.getStatus();
	}
	
}
