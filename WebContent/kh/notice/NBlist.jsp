<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeBoard List</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
		    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>


<style>
	body {background-color: #D8E3E7;}

/*navibar*/
  .navbar>.container-fluid {
            padding: 0px;
        }

        .navbar-nav {
            flex-grow: 1;
            justify-content: space-around;
        }

        .slide {
            position: absolute;
            width: 100%;
            height: 50px;
            top: 100%;
            background-color: #55555550;
        }
.container {
    margin-top: 100px;
    width: 900px;
}
.first {
	padding-top:20px;
	border-bottom: 3px solid black;
	margin-left:10px;
	margin-right:10px;
	text-align:center;
	font-weight: bold; 
	font-size: larger;
}

.second {
	border-bottom: 1px solid rgba(0, 0, 0, 0.192);
	margin-left:10px;
	margin-right:10px;
	text-align:center;
	font-size: large;
}

h2{margin-left: 20px;
font-weight: bold;
padding-top:10px;

padding-bottom:10px;}

.branch_list{padding-top:10px;
padding-bottom:40px;
}

.pagingBar a{font-weight: bold; font-size: larger; 
			 }
li a:hover{
color: cadetblue;

}
.container a{
	color: black;
	font-weight: bold;
}

.title{
text-align: center;
}

.writeBtn{
float: right;
}
.search {
	margin-left:20px;
	float:left;
}


.footer{padding-top:20px; padding-bottom:30px;}

</style>

<script>
$(function(){
$(".writeBtn").on("click",function(){
location.href="${pageContext.request.contextPath}/towrite.nboard"
});

$("#back").on("click",function(){
	location.href="${pageContext.request.contextPath}/main.main"
	});

$(document).on('click', '#navbarDropdownMenuLink', function() {
	   if($(this).siblings($(".dropdown-menu")).css("display") == "none"){
	 	  $(this).siblings($(".dropdown-menu")).css("display",'block')
	 	  for(let i =0; i<$(".dropdown-menu").length; i++){
	 		 if(($($(".dropdown-menu")[i]).text() !== $(this).siblings($(".dropdown-menu")).text())){
	 			$($(".dropdown-menu")[i]).css("display","none");
	 		}
	 	  }
	   }else{
	 	  $(this).siblings($(".dropdown-menu")).css("display",'none')
	   }
	})
	  $(document).on("click", function(e){
           if($(e.target).attr("id")!="navbarDropdownMenuLink"){
        	   for(let i =0; i<$(".dropdown-menu").length; i++){
        			$($(".dropdown-menu")[i]).css("display","none");
        	   }
           }
        })
	
});
</script>
</head>
<body>
<jsp:include page= "/header.jsp" />
<jsp:include page="/navibar.jsp"></jsp:include>

    <div class="container shadow bg-white rounded">        
<h2 class ="text-center">공지 게시판</h2>
    
		
        <div class="row first">
            <div class="col-12 col-md-1 d-none d-md-block">No</div>
            <div class="col-12 col-md-2">지점/반</div>
            <div class="col-12 col-md-3 title" >제목</div>
            <div class="col-12 col-md-2 d-none d-md-block">작성자</div>
            <div class="col-12 col-md-2 d-none d-md-block">작성일자</div>
            <div class="col-12 col-md-2 d-none d-md-block">조회수</div>
        </div>

   <c:forEach var="i" items="${boardlist}" varStatus="s">
            <div class="row second">
            
                <div class="col-1 col-md-1 d-none d-md-block">${s.count}</div>
                <div class="col-12 col-md-2">${i.branch}/ ${i.khClass} </div>
                <div class="col-12 col-md-3 title" ><a href="${pageContext.request.contextPath}/detailView.nboard?seq=${i.seq}">${i.title}</a> [${count.replyCount(i.seq)}]</div>
                <div class="col-3 col-md-2  d-md-block">${i.writer} </div>
                <div class="col-2 col-md-2  d-md-block"><fmt:formatDate pattern="yyyy-MM-dd" value="${i.write_date}"/></div>
                <div class="col-1 col-md-2  d-md-block">${i.viewCount}</div>
            </div>
        </c:forEach>
        
        
        <!--페이징 네비바-->
			<div class="nav justify-content-center pagingBar">
				<ul class="pagination">	
					 <li class="page-item"><a href="${pageContext.request.contextPath}/list.nboard?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}" class="page-link"> &laquo; </a>
						<c:forEach var="i" items="${navi}" varStatus="s">
							<li class="page-item"><a href="${pageContext.request.contextPath}/list.nboard?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}" class="page-link" id="${i}">${i}</a>
						</c:forEach>
					 <li class="page-item"><a href="${pageContext.request.contextPath}/list.nboard?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}" class="page-link"> &raquo; </a>
				</ul>
			</div>
			<input type = hidden id = cpage value = ${cpage }>	
        <div class="text-right footer">
         <input type=button class="btn btn-secondary" value="메인으로" id="back">
        
 	<div class="search">
 		<form action="${pageContext.request.contextPath}/list.nboard" method="get">
	<c:choose>
					
					<c:when test="${not empty branch}">
						<select name="category">
							<option value="title">제목</option>
							<option value="contents">내용</option>
						</select>
						<input type="hidden" name="cpage" value="1">
						<input type="hidden" name="branch" value="${branch}">
						<input type="text" placeholder="검색어를 입력하세요" name="keyword"
							required value="${keyword}">
						<input type="submit" value="찾기" class="btn btn-dark"
							id="searchBtn">
							
					</c:when>
					<c:otherwise>
						<select name="category">
							<option value="title">제목</option>
							<option value="contents">내용</option>
						</select>
						<input type="hidden" name="cpage" value="1">
						<input type="text" placeholder="검색어를 입력하세요" name="keyword"
							required value="${keyword}">
						<input type="submit" value="찾기" class="btn btn-dark"
							id="searchBtn">
							
					</c:otherwise>
				</c:choose>
	 </form>		  
 </div>	
 </div>
    </div>
</body>
</html>