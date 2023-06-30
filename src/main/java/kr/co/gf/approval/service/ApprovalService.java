package kr.co.gf.approval.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.approval.dao.ApprovalDAO;
import kr.co.gf.approval.dto.ApprovalDTO;

@Service
@MapperScan("kr.co.gf.approval.dao")
public class ApprovalService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalDAO dao;
	
	@Value("${spring.servlet.multipart.location}") private String root;

	public String loginIdName(String loginId) {
		logger.info(loginId);
		return dao.loginIdName(loginId);
	}

	public String manager() {
		return dao.manager();
	}

	public String top_Manager() {
		return dao.top_Manager();
	}

	public String position(String loginId) {
		return dao.position(loginId);
	}

	public ModelAndView approvalAllList(String loginId) {
		logger.info("결재 리스트 이동 : " + loginId);
		ModelAndView mav = new ModelAndView("approvalAllList");
		ArrayList<ApprovalDTO> list = dao.approvalAllList(loginId);
		mav.addObject("list", list);
		return mav;
	}

	public String eventRequestWrite(HashMap<String, String> params, MultipartFile[] uploadFiles) {
String page = "redirect:/approvalAllList.do";

		logger.info("params"+params);

		ApprovalDTO dto = new ApprovalDTO();
		
		dto.setEmp_no(Integer.parseInt(params.get("emp_no")));
		dto.setApproval(params.get("approval"));
		dto.setSubject(params.get("subject"));

		String write_dateString = params.get("write_date"); // 문자열로 된 날짜 값 가져오기
		// 날짜 포맷 지정 (예: "yyyy.MM.dd")
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
		try {
		    LocalDate localDate = LocalDate.parse(write_dateString, formatter);
		    java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
		    dto.setWrite_date(sqlDate);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		dto.setState(params.get("state"));		
		dto.setManager(params.get("manager"));
		dto.setTop_manager(params.get("top_manager"));
		
		int success = dao.eventRequestWrite(dto);
		
		if(success == 1) {
			//dto.setStart_day(params.get("start_day"));
			//dto.setFinish_day(params.get("finish_day"));
			//dto.setReason(params.get("reason");
			//dto.setEtc(params.get("etc");
			//dao.eventRequestWrite2(dto);
		}
		
		for (MultipartFile file : uploadFiles) {
			logger.info("photo 있으면 false, 없으면 true :"+file.isEmpty());
			if(file.isEmpty()==false) {
				upload(file,dto.getBoard_num());
				
				try {
					Thread.sleep(1);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
			}
		} 
		return page;
	}
	
public void upload(MultipartFile uploadFile,int board_num) {
		
		// 1. 파일명 추출
		String ori_photo_name = uploadFile.getOriginalFilename();
		int c_idx = 7;
		//ReferenceDTO dto = new ReferenceDTO();
		//int board_num = dto.getBoard_num();
		logger.info("board_num"+board_num);
		
		// 2. 새파일 생성(현재시간 + 확장자)
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String new_photo_name = System.currentTimeMillis() + ext;
		logger.info(ori_photo_name+" => "+new_photo_name);
		
		// 3. 파일 저장
		try {
			byte[] bytes = uploadFile.getBytes();
			Path path = Paths.get(root+"/"+new_photo_name);
			Files.write(path, bytes);
			dao.approvalFileWrite(c_idx,ori_photo_name,new_photo_name,board_num);
		} catch (IOException e) {
			e.printStackTrace();
		}
}

	public ModelAndView approvalSaveList(String loginId) {
		ModelAndView mav = new ModelAndView("approvalSaveList");
		ArrayList<ApprovalDTO> list = dao.approvalSaveList(loginId);
		mav.addObject("list",list);
		return mav;
	}



	
	

}
