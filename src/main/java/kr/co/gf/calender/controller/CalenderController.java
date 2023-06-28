package kr.co.gf.calender.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gf.calender.dto.CalenderDTO;
import kr.co.gf.calender.service.CalenderService;

@Controller
public class CalenderController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	CalenderService service;

	@RequestMapping(value = "/calendar")
	public String calender() {

		return "calendar";
	}

	@GetMapping("/calendarList")
	@ResponseBody
	public HashMap<String, Object> calendarlist(Model model) {
		logger.info("캘린더 리스트 불러오기");
		// 이벤트 목록 조회와 관련된 처리를 수행합니다.
		List<CalenderDTO> calendarlist = service.calendarlist(); // 이벤트 목록을 가져오는 서비스 메서드를 호출합니다.
		// model.addAttribute("calendarlist", calendarlist); // 조회한 이벤트 목록을 모델에 추가합니다.
		logger.info("calendarlist :" + calendarlist);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("calendarlist", calendarlist);

		return map; // 이벤트 목록을 보여주는 페이지의 뷰 이름을 반환합니다.
	}

	@PostMapping("/events")
	public String createEvent(@RequestParam String title, @RequestParam String start, @RequestParam String end) {

		logger.info("시간:" + start);
		logger.info("회원이름:" + title);
		// 유효성 검사 등 필요한 처리를 수행합니다.

		
		  // Calendardto 객체 생성 
		  CalenderDTO dto = new CalenderDTO();
		  dto.setEvent_name(title); 
		  dto.setStart_time(start);
		  dto.setEnd_time(end);
		  
		  // 서비스 계층을 통해 이벤트 등록 
		  service.createEvent(dto);
		 

		// 저장 후에는 원하는 페이지로 리다이렉트합니다.
		return "redirect:/calendar";
	}
}
