<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 상세보기</title>
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
						<h1>자료실</h1>
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
			<form action="referenceUpdate.do?r_idx=${dto.r_idx}">
			<button>수정</button>
			<button onclick="location.href='referenceDelete.do?r_idx=${dto.r_idx}'">삭제</button>
	<table class="table table-bordered table-hover dataTable dtr-inline">
		<tr>
			<th>글번호</th>
			<td><input type="text" name="r_idx" value="${dto.r_idx}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="emp_no" value="${loginName}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" value="${dto.subject}"/></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><input type="text" name="date" value="${dto.date}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content">${dto.content}</textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><a href="download.do?path=${dto.new_photo_name}&idx=${dto.r_idx}">${dto.ori_photo_name}</a></td>
		</tr>           
		<tr>
			<th colspan="2">
				<button onclick="location.href='referenceList.do'">목록</button>
			</th>
		</tr>
	</table>
	</form>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
</html>