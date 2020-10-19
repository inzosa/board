<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<div class="container">
	<main>
		<h1>게시글목록</h1>
		<hr />
		<table border="1" class="table table-dark table-hover">
			<tr>
				<td>ID</td>
				<td>TITLE</td>
				<td>READCOUNT</td>
				<td>CREATEDATE</td>
			</tr>
			<c:forEach var="board" items="${boards.content}">
				<tr>
					<td>${board.id }</td>
					<td><a href="/board/${board.id}">${board.title }</a></td>
					<td>${board.readCount }</td>
					<fmt:formatDate value="${board.createDate }" var="date"
						pattern="yyyy-MM-dd" />
					<td>${date }</td>
				</tr>
			</c:forEach>
		</table>
		<ul class="pagination">
			<c:choose>
				<c:when test="${boards.first }">
					<li class="page-item disabled"><a class="page-link"href="/list?page=${boards.pageable.pageNumber-1}">Previous</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"href="/list?page=${boards.pageable.pageNumber-1}">Previous</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${boards.last }">
					<li class="page-item disabled"><a class="page-link"href="/list?page=${boards.pageable.pageNumber+1}">Next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"href="/list?page=${boards.pageable.pageNumber+1}">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</main>
</div>

<%@ include file="layout/footer.jsp"%>
