package kr.co.gf.board.service;

import java.io.File;
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
	//@Value("${spring.servlet.multipart.location}")private String root;
	
	Logger logger =LoggerFactory.getLogger(getClass());

	public String nwrite(HashMap<String, String> params, MultipartFile photo) {
		
		  NoticeDTO dto = new NoticeDTO();
		  
		  String page= "redirect:/nlist.go";
		  
		  dto.setTitle(params.get("title"));
		  dto.setContent(params.get("content"));
		  dto.setFix(params.get("fix"));
		  String emp_no=params.get("emp_no");
		  dto.setEmp_no(emp_no);

		  int row=ndao.nwrite(dto);
		  
		  int n_idx=dto.getN_idx();
		  
		  if (photo.getOriginalFilename()!=null) {
			  photoSave(photo,params,n_idx);					  
		  } 
		  return page;
		  
		  
	}
	public String photoSave(MultipartFile photo,HashMap<String, String>params, int n_idx) {
			
		/*	NoticeDTO dto = new NoticeDTO();
			String c_Content=dto.setC_Content("공지사항");
			int c_idx=dto.setC_idx(3);
		
			String oriName= photo.getOriginalFilename(); 
			String ext= oriName.substring(oriName.lastIndexOf(".")); 
			String newName= System.currentTimeMillis()+ext;
				  
			try { 
				byte[] bytes=photo.getBytes(); 
				Path path= Paths.get(root+"/"+newName);
				Files.write(path, bytes);
				
				ndao.photoSave(oriName, newName, c_Content, c_idx , n_idx );
				} 
			catch (IOException e) { 
				e.printStackTrace(); 
				}*/	  
			return null;
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

	public void nupdate(HashMap<String, String> params) {
		ndao.nupdate(params);
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

	/*
	 * public Object getinfo(String emp_no, String n_idx) { return
	 * ndao.getinfo(emp_no,n_idx); }
	 */
}	
		

	


