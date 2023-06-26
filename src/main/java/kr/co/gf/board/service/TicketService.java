package kr.co.gf.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.board.dao.TicketDAO;
import kr.co.gf.board.dto.TicketDTO;

@Service
@MapperScan(value = {"kr.co.gf.board.dao"})
public class TicketService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired TicketDAO dao;

	public int ticketRegist(TicketDTO dto) {
		return dao.ticketRegist(dto);
	}

	public ArrayList<TicketDTO> ticketList() {
		return dao.ticketList();
	}

	public int ticketModify(TicketDTO dto) {
		// TODO Auto-generated method stub
		return dao.ticketModify(dto);
	}

	public HashMap<String, Object> ticketDelete(ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = 0;
		for(String id : delList) {
			row += dao.ticketDelete(id);
		}
		map.put("success", true);
		return map;
	}

}
