package board.dto;
public class BoardDTO {
private int client_n_seq, max_client_n_seq;
private String client_code, clientname, client_idn;


	public BoardDTO() {
	}


	public int getClient_n_seq() {
		return client_n_seq;
	}


	public void setClient_n_seq(int client_n_seq) {
		this.client_n_seq = client_n_seq;
	}


	public String getClient_code() {
		return client_code;
	}


	public void setClient_code(String client_code) {
		this.client_code = client_code;
	}


	public String getClientname() {
		return clientname;
	}


	public void setClientname(String clientname) {
		this.clientname = clientname;
	}


	public String getClient_idn() {
		return client_idn;
	}


	public void setClient_idn(String client_idn) {
		this.client_idn = client_idn;
	}



	public int getMax_client_n_seq() {
		return max_client_n_seq;
	}


	public void setMax_client_n_seq(int max_client_n_seq) {
		this.max_client_n_seq = max_client_n_seq;
	}


}