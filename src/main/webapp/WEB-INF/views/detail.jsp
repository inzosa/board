<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<div class="container">
	<main>
		<h1>게시글 상세보기</h1>
		<hr />
		<form class="form-group">
			<input type="text" id="title" class="form-control" style="margin-bottom: 20px;" value="${board.title }" />
			<div id="editor" class="content" style="margin-bottom: 20px; height: 500px;">${board.content }</div>
			<button onClick="deleteBoard(${board.id})" class="btn btn-danger float-right">삭제</button>
			<button onClick="updateBoard(${board.id})" class="btn btn-success float-right" style="margin-right: 10px;">수정</button>
			<br />
		</form>
	</main>
</div>
<script>
var toolbarOptions = [
	  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
	  ['blockquote', 'code-block'],
		
	  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
	  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
	  [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
	  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
	  [{ 'direction': 'rtl' }],                         // text direction

	  [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
	  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

	  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
	  [{ 'font': [] }],
	  [{ 'align': [] }],
	  ['image'],
	  
	  ['clean']                                         // remove formatting button
	];

	var quill = new Quill('#editor', {
	  modules: {
	    toolbar: toolbarOptions
	  },
	  theme: 'snow',
	  placeholder: "내용을 입력해주세요."
	});
	function updateBoard(id) {
		// id, title, content
		let title = document.querySelector("#title").value;
		let content = document.querySelector(".content .ql-editor").innerHTML;
		
		let board = {
			title: title,
			content: content
		};

		fetch("/board/" + id, {
			method: "put",
			headers: {
				"Content-Type": "application/json; charset=utf-8",
			},
			body: JSON.stringify(board),
		})
		.then(res => res.text())
		.then(res => {
			if(res == "ok") {
				alert("수정완료");
				location.reload();
			} else {
				alert("수정실패");
			}
		});

		console.log(board);
	}

	function deleteBoard(id) {
		fetch("/board/" + id, {
			method: "delete"	
		})
		.then(res=>res.text())
		.then(res=> {
			if(res == "ok") {
				alert("삭제성공");
				location.href="/list";
			} else {
				alert("삭제실패");
			}
		});
	}
</script>

<%@ include file="layout/footer.jsp"%>
