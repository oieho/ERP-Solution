<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Iterator, java.util.ArrayList, java.util.*, board.dto.*" %>
<!-- header.jsp include -->
<%request.setCharacterEncoding("UTF-8"); %>
   <jsp:include page="../includes/header.jsp">
   <jsp:param name="title" value="ERPSystem 거래처 리스트 페이지"/>
   </jsp:include>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">거래처 리스트 페이지</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                       <th width="10%">인덱스번호</th>
                                       <th>회사코드</th>
                                       <th>회사명</th>
                                       <th>사업자번호</th>
                                    </tr>   
                                </thead>
                                 <% ArrayList list = (ArrayList)request.getAttribute("client_list");

					if(list!=null){
						
						Iterator iter = list.iterator();
						while(iter.hasNext()==true){
						BoardDTO data = (BoardDTO)iter.next();
						int client_n_seq = data.getClient_n_seq();
						String client_code = data.getClient_code();
						String clientname = data.getClientname();
						String client_idn = data.getClient_idn();

					%>
                    <tr>
                      <td align="center"><%= client_n_seq %></td>
                      <td><a href="client_r_dpage.do?num=<%= client_n_seq%>"><%= client_code %></a></td>
                      <td><%= clientname %></td>
                      <td><%= client_idn %></td>
                    </tr>
                    
                    
                    <%
						} //end while
					}//end if
					%>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->

        <!-- 아래 코드는 footer.jsp include -->
        <%@include file="../includes/footer.jsp" %>