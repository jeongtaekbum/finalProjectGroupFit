package kr.co.gf.calender.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.calender.dao.CalenderDAO;
import kr.co.gf.calender.dto.CalenderDTO;

@Service
@MapperScan("kr.co.gf.calender.dao")
public class CalenderService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CalenderDAO dao;


	public void createEvent(CalenderDTO dto) {
		dao.createEvent(dto);
	}



	public List<CalenderDTO> calendarlist() {
		
		return dao.calendarlist();
	}



	public void updateEvent(CalenderDTO dto) {
		dao.updateEvent(dto);
		
	}

		
	}
	
	
	
	


