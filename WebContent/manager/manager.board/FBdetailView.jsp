<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>${view.title}</title>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<link rel="stylesheet"
	href="${pageContext.request.contextPath}/manager/css/manager.css">
			<style>
	
				div {
					display: block;
				}

				h2 {
					margin-left: 20px;
					margin-bottom: 0px;
					font-weight: bold;
					display: block;
					font-size: 1.17em;
					margin-inline-end: 0px;
				}

				.title_area {
					border-bottom: 1px solid #ddd;
				}


				.commentItem a:hover {
					color: cadetblue;
				}

				a {
					text-decoration: none;
					cursor: pointer;
					color: black;
					font-weight: bold;
				}

				.title {
					text-align: center;
				}

				/* 내용 */
				.contents {
					height: 200px;
					border: 1px solid #ddd;
					border-radius: 10px;
				}

				/* 작성자 정보 */
				.WriterInfo .profile_info .name_box .name {
					margin-right: 6px;
					font-size: 13px;
					font-weight: 700;
				}

				.WriterInfo .article_info {
					font-size: 12px;
					line-height: 13px;
					
				}
				.writerInfo{margin-bottom:20px;}
				/* 댓글 */
				.com {
					float: right;
				}

				.com .button_comment {
					display: inline-block;
					margin-right: 20px;
					vertical-align: top;
				}

				.comment_writer .comment_inbox_text {
					display: block;
					background-attachment: scroll;
					width: 100%;
					min-height: 17px;
					padding-right: 1px;
					padding-bottom: 10px;
					border: 1px solid #ddd;
					font-size: 15px;
					resize: none;
					box-sizing: border-box;
					background: transparent;
					outline: 0;
					border-radius: 1px;
				}

				textarea {
					width: 100%;
					white-space: pre-wrap;
					text-rendering: auto;
					flex-direction: column;
					cursor: text;
					column-count: initial !important;
					word-spacing: normal;
					overflow: visible;
					overflow-wrap: break-word;
					height: 100px;
				}

				#replyBtn {
					float: right;
					margin-top: 5px;
				}


				.comment_list {
					list-style: none;
					list-style-position: initial;
					list-style-image: initial;
					list-style-type: none;
					margin-top: 40px;
					margin-bottom: 40px;
					border:none;
				}

				.CommentBox .comment_list .CommentItem {
					margin-left: 46px;
					padding-left: 0;
				}

				.comment_box {
					border: 1px solid black;
					padding-right: 0;
				}

				.CommentBox .comment_list .comment_info_box {
					margin-top: 10px;
					font-size: 12px;
				}

				.articleInfo {
					margin-top: 5px;
					margin-bottom: 5px;
				}

				.deleteReply {
					float: right;
					margin-right: 5px;
					padding-top: 5px;
				}

				.modifyReply {
					float: right;
					margin-left: 5px;
				}

				.complete {
					margin-left: 5px;
				}
				
				#report{font-size:12px;}
			</style>
			<script>
				$(function () {
				
					$("#deleteBtn").on("click",function () { //게시글 삭제
								let check = confirm("정말 게시글을 삭제하겠습니까?");
								if (check) {
									location.href = "${pageContext.request.contextPath}/freeBoardDelete.manager?currentPage=${page}&branch=${branch}&category=${category}&search=${search}&seq="
										+ $("#deleteBtn").val(); //게시글 삭제 확인 팝업
								} else {
									return;
								}
							});

					
				});
			</script>
		</head>

		<body>
<div class="wrap">
				<jsp:include page="../menu.jsp"></jsp:include>
				<div>
				<header>
					<div>
						<h1>자유 게시판</h1>
					</div>
					</header>
			<div class="container">
				<!-- 게시물 제목 -->
				<div class="content">
							<div class="col">
				<div class="col-12 title_area">

					<h3>${view.title}</h3>

				</div>
				<!-- 작성자 정보 -->
				<div class="writerInfo">
					<div class="profile_info">
						<a href=""> <img src="title.jpg" alt="프로필 사진" width="30" height="30">
						</a>
						<div class="name_box">
							<a href="#" role="button" class="target"> ${view.writer} </a> <em
								class="position">${view.branch}지점 </em> <!-- 게시글 작성자 -->
						</div>
					</div>
					<!-- 작성일자,조회수 -->
					<div class="articleInfo">
						<span class="date">${view.write_date}</span> <span class="count">조회
							${view.viewCount}</span> <input type="hidden" name="seq" value="${view.seq}">

						<!-- 댓글 수 및 신고버튼-->
						<div class="com">
							<a href="#" role="button" class="button_comment"> <strong class="num"> 댓글
									${count.replyCount(view.seq)}</strong>
							</a>
							
						</div>
					</div>

				</div>
				<!-- 게시글  내용 -->
				<div class="col-12 md-5 contents">
					<p class="target">${view.contents}</p>
				</div>
				<hr>
				<!--첨부 파일리스트 출력  -->
				<div id="content">
					<fieldset class="file_box">
						<legend>[첨부 파일 리스트]</legend>
						<c:forEach var="file" items="${filelist}">
							<!--첨부파일 다운로드-->
							<a
								href="download.file?seq=${file.seq}&sysname=${file.sysName}&oriname=${file.oriName}">${file.oriName}</a>
							<br>
						</c:forEach>
					</fieldset>
				</div>
				<hr>
				<!-- 댓글 작성 -->
				<h2 class="comment_title">댓글</h2>

				<div class="col-12 md-5 commentBox">

					<c:forEach items="${reply}" var="i">
						<ul class="comment_list">
							<li class="commentItem">
							
								<!-- 댓글 출력 -->
								<div class="col-12 d-md-block comment_box">

									<div class="comment_writerInfo">
										<a id="" href="#" role="button" aria-haspopup="true" aria-expanded="false"
											class="comment_nickname"> ${i.writer}
										</a>
									</div>
							
								</div>
							</li>
						</ul>
					</c:forEach>
				
				</div>
				<hr>
				
				<div class="btn_wrap text-right">
					
							
							<button type="button" value="${view.seq}" id="deleteBtn" name="delete"
								class="btn btn-dark">삭제</button>

					<a href="${pageContext.request.contextPath}/boardList.manager?currentPage=${page}&branch=${branch}&category=${category}&search=${search}" class="btn btn-secondary">목록으로</a>

				</div>
			</div>
			</div>
			</div>
			</div>
			</div>
		</body>