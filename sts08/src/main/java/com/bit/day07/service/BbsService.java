package com.bit.day07.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.day07.model.entity.BbsVo;

public interface BbsService {
	
	List<BbsVo> list() throws SQLException;
}
