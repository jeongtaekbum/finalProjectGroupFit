package kr.co.gf.board.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import kr.co.gf.board.dao.NoticeDAO;
import kr.co.gf.board.dto.NoticeDTO;

@Service
@MapperScan(value={"kr.co.gf.board.dao"})
public class NoticeService {
	
	@Autowired NoticeDAO ndao;
	@Value("${spring.servlet.multipart.location}")private String root;
	
	Logger logger =LoggerFactory.getLogger(getClass());

	public String nwrite(HashMap<String, String> params, MultipartFile[] photos) {
		
		  NoticeDTO dto = new NoticeDTO();
		  
		  String page= "redirect:/nlist.go";
		  
		  dto.setTitle(params.get("title"));
		  dto.setContent(params.get("content"));
		  dto.setFix(params.get("fix"));
		  String emp_no=params.get("emp_no");
		  dto.setEmp_no(emp_no);

		  int row=ndao.nwrite(dto);
		  
//		  int n_idx=dto.getN_idx();
		  
		  for (MultipartFile photo : photos) {
			if (photo.getOriginalFilename()!=null) {
				 //logger.info("photosave가기 전"+photo.getOriginalFilename());
				String flag="write";
//				 photoSave(photo,n_idx,flag);				 
				 try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
		  
		  return page;
		  
		  
	}

	public ArrayList<NoticeDTO> nlist() {
		return ndao.nlist();
	}
	
	public HashMap<String, String> ndetail(String n_idx, String string) {
		if (string.equals("detail")) {
			ndao.hit(n_idx);
		}
		return ndao.ndetail(n_idx);
	}

	public void getinfo(String emp_no, String n_idx) {
		ndao.getinfo(emp_no, n_idx);
		
	}

	public ArrayList<NoticeDTO> rlist(String n_idx) {
		return ndao.rlist(n_idx);
	}
	
	public int rcount(String emp_no, String n_idx) {
		return ndao.rcount(emp_no, n_idx);
	}
	public int ndelete(String n_idx) {
		int row = ndao.rdelete(n_idx);
		logger.info("reader 삭제됐으면 숫자 1 반환+"+row);
		return ndao.ndelete(n_idx);
	}
	
	public void nupdate(HashMap<String, String> params, MultipartFile photos) {
		ndao.nupdate(params);
		String n_idx=params.get("n_idx");
		logger.info("업뎃하려면 n_idx는"+n_idx);
		NoticeDTO dto = new NoticeDTO();
		
		if (photos.getOriginalFilename()!=null) {
			String flag="pupdate";
//			photoSave(photos, n_idx, flag);
			/*
			 * String oriName=photos.getOriginalFilename(); String ext =
			 * oriName.substring(oriName.lastIndexOf(".")); String newName =
			 * System.currentTimeMillis()+ext;
			 * 
			 * int c_idx=dto.setC_idx(5);
			 * logger.info("update icin oriName"+oriName+"newName은"+newName+"c_idx는"+c_idx+
			 * "n_idx는"+n_idx); int row=ndao.pupdate(n_idx, c_idx, oriName, newName);
			 * logger.info("사진 업뎃 됐으면 숫자는 1임"+row);
			 * 
			 * try { byte[] bytes=photos.getBytes(); //파일 객체화 Path path=
			 * Paths.get(root+"/"+newName); Files.write(path, bytes);
			 * 
			 * //logger.info(oriName+"newname"+newName+"n_idx"+n_idx+c_idx); } catch
			 * (IOException e) { e.printStackTrace(); }
			 */
		}
		/*
		 * String page = "redirect:/ndetail.do?n_idx="+"n_idx"; return page;
		 */		
	}

	/*
	 * public Object getinfo(String emp_no, String n_idx) { return
	 * ndao.getinfo(emp_no,n_idx); }
	 */
}	
		

	


