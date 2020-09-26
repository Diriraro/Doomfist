package com.doom.s1.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.doom.s1.board.BoardService;
import com.doom.s1.board.BoardVO;
import com.doom.s1.util.Pager;

@Service
//@Transactional //예외 발생시 자동으로 롤백  root-contex 선언
public class NoticeService implements BoardService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private ServletContext servletContext;//이렇게해도됨
	

	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		
		pager.makeRow();
		long totalCount = noticeDAO.boardCount(pager);
		pager.makePage(totalCount);
		return noticeDAO.boardList(pager);
	}

	@Override
	public BoardVO boardSelect(long num) throws Exception {
		// TODO Auto-generated method stub
		noticeDAO.likesUpdate(num);
		return noticeDAO.boardSelect(num);
	}

	@Override
	public int boardWrite(BoardVO boardVO) throws Exception {
		//시퀀스의 번호 받아오기.
		boardVO.setNo_num(noticeDAO.boardNum());
		
		//noticeDAO table insert 해야 파일들을 집어 넣을것이다.
		 int result = noticeDAO.boardWrite(boardVO);
		return result; //
	}

	@Override
	public int boardUpdate(BoardVO boardVO) throws Exception {
		int result = noticeDAO.boardUpdate(boardVO);
		//System.out.println("service uo:"+result);
		return result;
	}

	@Override
	public int boardDelete(long num) throws Exception {
		//글번호로 파일번호
		return noticeDAO.boardDelete(num);
	}
		

}
