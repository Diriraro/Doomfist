package com.doom.s1.qna;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.doom.s1.member.MemberDAO;
import com.doom.s1.member.MemberVO;
import com.doom.s1.qna.qnaFile.QnaFileDAO;
import com.doom.s1.qna.qnaFile.QnaFileVO;
import com.doom.s1.qnacheck.QnaCheckDAO;
import com.doom.s1.qnacheck.QnaCheckVO;
import com.doom.s1.qnamenu.QnaMenuDAO;
import com.doom.s1.qnamenu.QnaMenuVO;
import com.doom.s1.util.FileSaver;
import com.doom.s1.util.Pager;

@Service
public class QnaService {
	
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private QnaFileDAO qnaFileDAO;
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private QnaMenuDAO qnaMenuDAO;
	@Autowired
	private QnaCheckDAO qnaCheckDAO;
	
	public MemberVO selectMember(String id) throws Exception{
		return qnaDAO.selectMember(id);
	}
	
	public List<QnaFileVO> qnaFileSelect(long qna_storekey)throws Exception{
		return qnaFileDAO.qnaFileSelect(qna_storekey);
	}
	
	public List<QnaMenuVO> qnaMenuSelect(long qna_storekey)throws Exception{
		return qnaMenuDAO.qnaMenuSelect(qna_storekey);
	}
	
	public int qnaJoin(QnaVO qnaVO, MultipartFile[] files,long [] qm_price, String [] qm_menu) throws Exception{
		
		String path = servletContext.getRealPath("/resources/qna_images");
		System.out.println(path);
		qnaVO.setQna_storekey(qnaDAO.qnaNum());
		
		int result = qnaDAO.qnaJoin(qnaVO);
		
		for(MultipartFile file : files) {
			if(file.getSize()>0) {
				QnaFileVO qnaFileVO = new QnaFileVO();
				String fileName = fileSaver.saveByTransfer(file, path);
				qnaFileVO.setQna_storekey(qnaVO.getQna_storekey());
				qnaFileVO.setQf_filename(fileName);
				qnaFileVO.setQf_oriname(file.getOriginalFilename());				
			
				qnaFileDAO.fileInsert(qnaFileVO);				
			}
		}
		
		QnaMenuVO qnaMenuVO = new QnaMenuVO();
		for (int i=0; i<qm_menu.length; i++) {
			qnaMenuVO.setQm_menu(qm_menu[i]);
			qnaMenuVO.setQm_price(qm_price[i]);
			qnaMenuVO.setQna_storekey(qnaVO.getQna_storekey());
			
		
			qnaMenuDAO.qnaMenuInsert(qnaMenuVO);	
		}
	
		
		QnaCheckVO qnaCheckVO = new QnaCheckVO();
		qnaCheckVO.setQna_storekey(qnaVO.getQna_storekey());
		qnaCheckVO.setQc_check(qnaVO.getQna_storekey());
		qnaCheckVO.setId(qnaVO.getId());
		qnaCheckVO.setQc_title(qnaVO.getQna_title());
	
		
		qnaCheckDAO.qnaCheckInsert(qnaCheckVO);
		
		qnaDAO.memberUpdate();
		
		
		return result;
	}
	
	public List<QnaVO> qnaList(Pager pager)throws Exception{
		
		pager.makeRow();
		long totalCount = qnaDAO.qnaCount(pager);
		pager.makePage(totalCount);
		
		return qnaDAO.qnaList(pager);
		
	}
	
	public QnaVO qnaSelect(long qna_storekey)throws Exception{
		return qnaDAO.qnaSelect(qna_storekey);
	}
}
