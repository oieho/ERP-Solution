<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Iterator, java.util.ArrayList, java.util.*, board.dto.*, board.dao.*" %>
<!-- header.jsp include -->
   <jsp:include page="../includes/header.jsp">
   <jsp:param name="title" value="ERPSystem 거래처 상세 페이지"/>
   </jsp:include>
   <%
		BoardDAO dao = new BoardDAO();
   		BoardDTO data = new BoardDTO();
   		data = (BoardDTO) request.getAttribute("client_r_dpage");
   		String client_code = data.getClient_code();
   		String clientname = data.getClientname();
   		String client_idn = data.getClient_idn();
   		int client_n_seq = data.getClient_n_seq();
   		int max_client_n_seq = (Integer) request.getAttribute("max_client_n_seq");
   		
   %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">거래처 상세 페이지</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
							<%=client_n_seq %>
							<%= clientname %>
							<%= client_idn %>
							<%= client_code %>
							<button class="btn btn-hover" onclick="location.href='client_list.do'">목록</button>
							
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
<div style="margin-top:-20px;" class="col-sm-12">
  <ul class="pagination justify-content-end">
    
    <%
    if ((client_n_seq)>1){
    	
    %>
    <li class="page-item">
      <a class="page-link" href="client_r_dpage.do?num=<%= client_n_seq-1%>">Previous</a>
    </li>
    <%
    }
    %>
    <%
    if (client_n_seq!=max_client_n_seq){
    	
    %>
    <li class="page-item">
      <a class="page-link" href="client_r_dpage.do?num=<%= client_n_seq+1%>">Next</a>
    </li>
    <%
    }
    %>
  </ul>
  <div style="float:right; margin-top:20px;">
  <ul class="boardbuttonlist">
  <li><button class="btn btn-hover" onclick="location.href='client_r_write.do'">글 쓰기</button></li>
  <li><button class="btn btn-hover" onclick="location.href='client_r_modify.do'">글 수정</button></li>
  <li><button class="btn btn-hover" onclick="location.href='client_list.do'">목록</button></li>
  </ul>
  </div>
</div>

        <!-- 아래 코드는 footer.jsp include -->
        <%@include file="../includes/footer.jsp" %>