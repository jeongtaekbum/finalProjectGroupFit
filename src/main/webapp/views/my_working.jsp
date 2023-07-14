<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기에 페이지 이름 입력</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
   href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body>
   <jsp:include page="GroupFit_gnb.jsp" />
   <div class="content-wrapper" style="margin-top: 57.08px">
      <section class="content-header">
         <div class="container-fluid">
            <div class="row mb-2">
               <div class="col-sm-6">

               </div>
               <div class="col-sm-6">
                  <ol class="breadcrumb float-sm-right">
                     <li class="breadcrumb-item"><a href="#">메인</a></li>
                     <li class="breadcrumb-item active">뎁스1</li>
                     <li class="breadcrumb-item active">뎁스2</li>
                  </ol>
               </div>
            </div>
         </div>
         <!-- /.container-fluid -->
      </section>
<!-- Main content -->
      <section class="content">
         <div class="container-fluid">
            <h1 class="forcenter">나의 근태관리</h1>
               <!-- <div class="forbutton">
                  <button onclick="location.href='nwrite.go'">작성</button>
               </div> -->
    <table class="table second">
        <colgroup>
            <col width="15%"/>
            <col width="20%"/>
            <col width="15%"/>
            <col width="20%"/>
            <col width="20%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
            <tr>
                <th>사내번호</th>
                <th>날짜</th>
                <th>출근 시간</th>
                <th>퇴근 시간</th>
                <th>근무 시간</th>
                <th>출결 상태</th>
            </tr>
        </thead>        
        <tbody>
            <c:if test="${working eq null}">
                <tr>
                    <th id="forblack" style="text-align:center;" colspan="6">근태내역이 없습니다.</th>
                </tr>
            </c:if>
            <c:if test="${working.size() == 0}">
               <tr>
               <th colspan="6">근태내역이 없습니다.</th>
               </tr>
            </c:if>
            <c:forEach items="${working}" var="working">
                <c:if test="${not empty sessionScope.loginId}">
                    <tr>
                        <td style="text-align: center;">${working.emp_no}</td> 
                        <td style="text-align: center;">${working.work_date}</td>
                        <td style="text-align: center;">${working.come_time}</td>
                        <!--<td style="text-align: center;"><a href="ndetail.do?n_idx=${bbs.n_idx}&flag='detail'" id="detail">${bbs.title}</a></td>  -->
                        <td style="text-align: center;">${working.out_time}</td>
                        <td style="text-align: center;">${String.format('%.1f', (working.out_time.time - working.come_time.time) / (1000.0 * 60 * 60))} </td>                       
                        <td style="text-align: center;">${working.w_type}</td>
                    </tr>
                </c:if>         
            </c:forEach>
        </tbody>
       </table>
         </div>
         <!--/. container-fluid -->
      </section>
   </div>
</body>
</html>