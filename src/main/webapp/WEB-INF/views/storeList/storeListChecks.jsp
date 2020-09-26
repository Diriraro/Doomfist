<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-hover">
				<tr>
					<td width="100px">식당고유번호<td> <!-- st_key -->
					<td>식당이름</td> <!-- st_title -->
					<td width="100px">아이디</td>	<!-- id -->
					<td>식당주소</td> <!-- st_address -->
					<td width="130px">식당 삭제 체크</td>

				</tr>
				
				<tr> <!-- 칸맞추기 -->
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td> 전체 체크 : <input type="checkbox" id="checkAll"> 
				</td>
				</tr>
				
				<c:forEach items="${vo}" var="vo" varStatus="status">
					<tr>
						<td id="id${status.index}">${vo.st_key}</td>
						
						<td>
						<c:catch>
						<!-- for(int i=0; i<1 i++ -->
							<c:forEach begin="1" end="${vo.depth}" >
								--
							</c:forEach>
						</c:catch>
						</td>
						<td><a href="./storeListSelect?st_key=${vo.st_key}">${vo.st_name}</a></td>
						<td>${vo.id}</td>
						<td>${vo.st_address}</td>
						<td> <input type="checkbox" name="del" title="id${status.index}" id="${vo.st_key}" class="check"></td>
					</tr>
				</c:forEach>
					
				<tr> <!-- 칸맞추기 -->
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td> <button class="btn btn-danger" id="del">삭제하기</button>
					</td>
				</tr>
				
			</table>