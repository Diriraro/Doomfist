<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
  
		<table class="table table-hover">
		 
			<tr>
				<td>ID</td>
				<td>NAME</td>
				<td>PHONE</td>
				<td>EMAIL</td>
				<td>회원 삭제 체크</td>
			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>전체 체크 : <input type="checkbox" id="checkAll"> </td>
			</tr>
			
			<c:forEach items="${member}" var="vo" varStatus="i">
			<tr>
				<td id="id${i.index}">${vo.id}</td>
				<td>${vo.name}</td>
				<td>${vo.phone}</td>
				<td>${vo.email}</td>
				<td> <input type="checkbox" name="del" title="id${i.index}" id="${vo.id}"  class="check"></td>
			</tr>
			</c:forEach>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><button class="btn btn-danger" id="del">회원 삭제</button> </td>
			</tr>
		
		</table>
		