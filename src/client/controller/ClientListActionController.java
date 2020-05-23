package client.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class ClientListActionController implements Controller {

	private BoardDAO dao;
	
	
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}
	public ClientListActionController() {
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		
		System.out.println("ListActionController execution!");
		
		ArrayList<BoardDTO> client_list = dao.client_page();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("client/client_list");       // list.jsp
		
		mav.addObject("client_list", client_list);
		
		return mav; 
	}

}