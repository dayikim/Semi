<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
    crossorigin="anonymous"></script>
   <link rel="stylesheet" href="../css/manager.css">
</head>
<body>
  <div class="wrap">
    <div class="navi">
      <div class="navbar-content scroll-div">
        <div class="admin">
        <a href="/logout.manager">로그아웃</a>
        </div>
        <ul class="menu">
          <li>
            <a href="#">회원 관리 <i class="fas fa-caret-down"></i></a>
            <ul class="submenu">
              <li>
                <a href="#">강사 관리</a>
              </li>
              <li>
                <a href="#">학생 관리</a>
              </li>
              <li>
                <a href="#">로그 기록</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#">게시물 관리<i class="fas fa-caret-down"></i></a>
            <ul class="submenu">
               <li>
                <a href="#">공지사항 관리</a>
              </li>
              <li>
                <a href="#">자유게시판 관리</a>
              </li>
              <li>
                <a href="#">과제게시판 관리</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#">신고 관리<i class="fas fa-caret-down"></i></a>
            <ul class="submenu">
              <li>
                <a href="#">게시글 신고</a>
              </li>
              <li>
                <a href="#">SNS 신고</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#" ">문의 관리<i class=" fas fa-caret-down"></i></a>
            <ul class="submenu">
              <li>
                <a href="#">문의 내용 관리</a>
              </li>

            </ul>
          <li>
            <a href="#">자리 신청 관리<i class="fas fa-caret-down"></i></a>
            <ul class="submenu">
              <li>
                <a href="#">종로</a>
              </li>
              <li>
                <a href="#">당산</a>
              </li>
              <li>
                <a href="#">강남</a>
              </li>
          </li>

        </ul>
        </li>
        </ul>
      </div>
    </div>
    <div>
      <div class="container">
        <header>
          <div>
            <h1>학생 관리</h1>
          </div>
        </header>

      </div>
    </div>
  </div>

</body>
</html>