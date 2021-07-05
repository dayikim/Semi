<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeBoard List</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>

.container {
    border-top:3px solid black;
    margin-top: 10px;
    width: 100%;
}
.row{
    border-bottom: 1px solid rgba(0, 0, 0, 0.192);
    
}

body{padding-top:30px;}
h2{margin-left: 20px;
font-weight: bold;
padding-bottom:10px;}

ul{padding-top:10px;
padding-bottom:10px;
}

li a:hover{
color: cadetblue;

}
a{color: black;
font-weight: bold;}

.title{
text-align: center;
}

.writeBtn{
float: right;
}
.search{ margin-top: 20px;
}

.footer{padding-top:10px;}

</style>

<script>
$(function(){
$(".writeBtn").on("click",function(){
location.href="${pageContext.request.contextPath}/towrite.nboard"
});

$("#back").on("click",function(){
	location.href="${pageContext.request.contextPath}/index.jsp"
	});


});
</script>
</head>
<body>
<h2 class ="text-center">공지 게시판</h2>
    <ul class="nav justify-content-center">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">전체</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">종로</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">강남</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#">당산</a>
        </li>
      </ul>

    <div class="container">        
        <div class="row">
            <div class="col-12 col-md-1 d-none d-md-block">No</div>
            <div class="col-12 col-md-2" style="text-align: center;">지점명</div>
            <div class="col-12 col-md-4 title" >제목</div>
            <div class="col-12 col-md-2 d-none d-md-block">작성자</div>
            <div class="col-12 col-md-2 d-none d-md-block">작성일자</div>
            <div class="col-12 col-md-1 d-none d-md-block">조회수</div>
        </div>

   <c:forEach var="i" items="${boardlist}">
            <div class="row">
            
                <div class="col-1 col-md-1 d-none d-md-block">${i.seq}</div>
                <div class="col-12 col-md-2">${i.branch}</div>
                <div class="col-12 col-md-4 title" ><a href="detailView.nboard?seq=${i.seq}">${i.title}</a> [${count.replyCount(i.seq)}]</div>
                <div class="col-3 col-md-2  d-md-block">${i.writer} </div>
                <div class="col-2 col-md-2  d-md-block">${i.writeDate}</div>
                <div class="col-1 col-md-1  d-md-block">${i.viewCount}</div>
            </div>
        </c:forEach>
        
        
        <!--페이징 네비바-->
			<div class="nav justify-content-center">
				<c:forEach var="i" items="${navi}" varStatus="s">
					<c:choose>
						<c:when test="${i=='>'}">
							<a href="/list.nboard?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}">${i}</a>
					
						</c:when>
						<c:when test="${i=='<'}">
							<a href="/list.nboard?cpage=${navi[s.index+1]-1}&category=${category}&keyword=${keyword}">${i}</a>
					
						</c:when>
						<c:otherwise>
							<a href="/list.nboard?cpage=${i}&category=${category}&keyword=${keyword}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>	
        <div class="footer">
         <input type=button class="btn btn-dark" value="메인으로" id="back">
        </div>
 	<div class="search">
 		<form action="/list.nboard" method="get">
		<input type="hidden" name="cpage" value="1">
		<select name="category"> 
		<option value="title">제목</option>
		<option value="writer">작성자</option>
		<option value="contents">내용</option>
		</select>
		<input type="text" placeholder="검색어를 입력하세요" name="keyword" required value="${keyword}">
		<input type= "submit" value="찾기" class="btn btn-dark" name="search" id="searchBtn">
	 </form>		  
 </div>	
    </div>
</body>
</html>