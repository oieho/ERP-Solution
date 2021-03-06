<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- header.jsp include -->
   <%@include file="/includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Board List Page
                        <button id='regBtn' type="button" class="btn btn-xs pull-right">Register
                        New Board</button>
                        </div>
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                       <th>#번호</th>
                                       <th>제목</th>
                                       <th>작성자</th>
                                       <th>작성일</th>
                                       <th>수정일</th>
                                    </tr>   
                                </thead>
                                <c:forEach items="${list}" var="board"> <!-- controller 에서 넘어오는 값(name 값) -->
                                <tr>
                                   <td><c:out value="${board.bno}" /></td>
                                      <td><c:out value="${board.title}" /></td>
                                      <td><c:out value="${board.writer}" /></td>
                                      <td><fmt:formatDate pattern="yyyy-MM-dd"
                                      value="${board.regdate}" /></td>
                                      <td><fmt:formatDate pattern="yyyy-MM-dd"
                                         value="${board.updateDate}" /></td>                                
                                </tr>
                                
                                </c:forEach>
                            
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

        <!-- 아래 코드는 footer.jsp include -->
        <%@include file="/includes/footer.jsp" %>
<script type="text/javascript">
$(document).ready(
   function(){
    $("#regBtn").on("click", 
function(){
      self.location ="/board/register";
   });
});
</script>
