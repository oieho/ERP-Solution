package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.dto.BoardDTO;

public class BoardDAO {

	DataSource ds;
	private BoardDTO BoardDTO;
	
	public BoardDAO() {
	try{
		Context ctx = new InitialContext();
		
		ds = (DataSource) ctx.lookup("java:comp/env/jdbc/orcl");
	} catch (Exception e){
		e.printStackTrace();
	}
	}

	public ArrayList<BoardDTO> client_page() {
		ArrayList<BoardDTO> client_page = new ArrayList<BoardDTO>();
		
		try{
			String sql = "SELECT * FROM client ORDER BY client_n_seq desc";
			Connection con = ds.getConnection();
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardDTO data = new BoardDTO();
				
				data.setClient_n_seq(rs.getInt("client_n_seq"));
				data.setClient_code(rs.getString("client_code"));
				data.setClientname(rs.getString("clientname"));
				data.setClient_idn(rs.getString("client_idn"));
				
				client_page.add(data);

			} // end while
			
		} catch(Exception e){
			System.out.println("SELECT ERR :"+e.getMessage());
		}
		
		return client_page;
	}
	
	public int max_client_n_seq() {
		int max_client_n_seq = 0;
		String sql = "SELECT MAX(client_n_seq) from client";
		try {
			Connection con = ds.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			max_client_n_seq = rs.getInt(1);
			System.out.println(max_client_n_seq);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return max_client_n_seq;
	}
	
	public BoardDTO client_retrieve(int client_n_seq) {
		Statement stmt=null;
		ResultSet rs = null;
		BoardDTO data = new BoardDTO();
		try {
			Connection con = ds.getConnection();
			
			String sql = "select * from client where client_n_seq="+client_n_seq;
			stmt=con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				data.setClient_n_seq(rs.getInt(1));
				data.setClient_code(rs.getString(2));
				data.setClientname(rs.getString(3));
				data.setClient_idn(rs.getString(4));
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	
	
	
}