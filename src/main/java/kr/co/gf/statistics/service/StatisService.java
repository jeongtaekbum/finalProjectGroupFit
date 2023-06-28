package kr.co.gf.statistics.service;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.statistics.dao.StatisDAO;
import kr.co.gf.statistics.dto.StatisDTO;

@Service
@MapperScan({"kr.co.gf.statistics.dao"})
public class StatisService {
	
	@Autowired StatisDAO dao;

	public ArrayList<StatisDTO> totalSales() {
		return dao.totalSales();
	}

	public ArrayList<StatisDTO> totalYearSales(String year) {
		return dao.totalYearSales(year);
	}

	public ArrayList<StatisDTO> branchList() {
		return dao.branchList();
	}

}
