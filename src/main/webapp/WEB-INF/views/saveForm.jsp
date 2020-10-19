<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<div class="container">
	<main>
		<h1>글쓰기 페이지</h1>
		<hr />
		<form class="form-group">
			<input type="text" name="title" id="title" class="form-control" placeholder="글제목" style="margin-bottom: 20px;"/>
			<div id="editor" class="content" style="margin-bottom: 20px; height: 500px;"></div>
			<button onClick="writeBoard()" class="btn btn-primary float-right">글쓰기완료</button> <br />
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

	function writeBoard() {
		event.preventDefault();
		let title = document.querySelector("#title").value;
		let content = document.querySelector(".content .ql-editor").innerHTML;
		
		let board = {
			title : title,
			content : content
		};
		
		console.log(board);
		fetch("/save", {
			method: "post",
			headers: {
				"Content-Type": "application/json; charset=utf-8"
			},
			body: JSON.stringify(board)
		})
		.then(res => res.text())
		.then(res => {
			if(res == "ok") {
				alert("글쓰기완료");
				location.href="/list";
			} else {
				alert("글쓰기실패");
			}
		});
	}
	
</script>

<%@ include file="layout/footer.jsp"%>