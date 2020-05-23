package client.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class ClientRetrieveActionController implements Controller {
	private BoardDAO dao;
	
	public void setDao(BoardDAO dao) {
	this.dao = dao;
}
	
	public ClientRetrieveActionController() {
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDTO data = new BoardDTO();
		int client_n_seq = Integer.parseInt(request.getParameter("num"));
		data = dao.client_retrieve(client_n_seq);	
		int max_client_n_seq = dao.max_client_n_seq();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("client/client_r_dpage");       // list.jsp
		mav.addObject("client_r_dpage", data);
		mav.addObject("max_client_n_seq", max_client_n_seq);
		return mav;
	}
}