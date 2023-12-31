<%--
  Created by IntelliJ IDEA.
  User: tnals
  Date: 2023/11/21
  Time: 1:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>free board</title>
  <script>
    function delete_ok(id){
      var a = confirm("정말로 삭제하겠습니까?");
      if(a) location.href='deletepost.jsp?id=' + id;
    }
  </script>
</head>
<body>
<h1>자유게시판</h1>
<h4>맘껏 떠들어제껴</h4>
<%
  BoardDAO boardDAO = new BoardDAO();
  List<BoardVO> list = boardDAO.getBoardList();
  request.setAttribute("list",list);
%>
<table id="list" width="90%">
  <tr>
    <th>Id</th>
    <th>Category</th>
    <th>Title</th>
    <th>Writer</th>
    <th>Content</th>
    <th>Regdate</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
  <c:forEach items="${list}" var="u">
    <tr>
      <td>${u.getSeq()}</td>
      <td>${u.getCategory()}</td>
      <td>${u.getTitle()}</td>
      <td>${u.getWriter()}</td>
      <td>${u.getContent()}</td>
      <td>${u.getRegdate()}</td>
      <td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
      <td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
    </tr>
  </c:forEach>
</table>
<br/><a href="addpostform.jsp">Add New Post</a>
</body>
</html>
