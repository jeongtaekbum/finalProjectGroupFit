<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>	
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>

	#aAp{
		margin-left: 70px;
		margin-top: 20px;
		display: inline;
	}	

	#table1 {
		border: 1px solid black;
	    border-collapse: collapse;
	    float: left;
	    margin-top: 4%;
	    margin-left: 5%;
	    position: absolute;
	}
	#table1 th{
		border: 1px solid black;
	    padding: 10px;
	    white-space: nowrap;
	}
	#table1 td{
		border: 1px solid black;
	    padding: 10px;
	}
	
	
	
	#table2{
		border: 1px solid black;
	    border-collapse: collapse;
	    margin-left: 6%;
	    width: 85%;
	}
	#table2 th{
		border: 1px solid black;
		padding: 10px;
		white-space: nowrap;
	}
	#table2 td{
		border: 1px solid black;
		padding: 10px;
	}
	
	
	
	#table3{
		border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px 10px;
	    text-align: center;
	    width: 30%;
	    float: right;
	    margin-right: 9%;
	    margin-top: 5%;
	    margin-bottom: 4%;
	}
	
	#table3 th {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px;
	    text-align: center;
	}
	
	#table3 td {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px 10px;
	    width: 100px;
	    text-align: center;
	}
	
	#table3_1{
	    border: 1px solid black;
	    border-collapse: collapse;
	    float: right;
	    margin-right: 9%;
	    margin-top: 2%;
	    text-align: center;
	    width: 20.6%;
	    margin-bottom: 5%;
	}
	
	#table3_1 th {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px;
	    text-align: center;
	}
	
	#table3_1 td {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px 10px;
	    text-align: center;
	    width: 40%;
	}
	
	#tr22{
		height: 100px;
		vertical-align: bottom;
	}
	
	#tr11{
		vertical-align: middle;
	}
	
	
	#tr2{
		height: 100px;
		vertical-align: bottom;
	}
	#tr1{
		vertical-align: middle;
	}
	
	#button_sin_mok {
	    margin-top: 5%;
	    margin-left: 35%;
	}

	textarea {
   		width: 60%;
   		height: 30%;
	}
	#td_inp{
		width:100%;
	}
	#cols{
		text-align: center;
	}
	#button_ch_sak{
		margin-left: 83%;
	}
	#accept{
		PADDING-RIGHT: 3%;
	    PADDING-BOTTOM: 2%;
	}
</style>
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
						<h1>새 결재 진행</h1>
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
				<h5 id="aAp"><a href="approvalVacationRequest.go">휴가신청</a></h5>
				<h5 id="aAp" style="text-decoration: underline; text-decoration-color:  skyblue; color: skyblue;"><a href="approvalExpenseReport.go">지출결의서</a></h5>
				<h5 id="aAp"><a href="approvalEventRequest.go">이벤트신청</a></h5>
				
			
				<div id="table1_div">
					<form action="approvalExpenseReport.do" method="post" enctype="multipart/form-data">
					<table id="table1">
						<tr>
							<th>기안자</th>
							<td>
								${loginIdName}
							</td>
						</tr>
						<tr>
							<th>기안일</th>
							<td><span id="date"></span></td>
						</tr>
						<tr>
							<th>결재구분</th>
							<td>지출결의서</td>
						</tr>
					</table>
					
				<c:if test="${position eq 'FC' or position eq '트레이너'}">
					<table id="table3">
						<tr id="tr1">
							<th rowspan="4">신청</th>
							<th>직원</th>
							<th rowspan="4">결재</th>
							<th>지점장</th>
							<th>대표</th>
						</tr>
						<tr id="tr2">
							<td>${loginIdName}</td>
							<td>${manager}</td>
							<td>${top_manager }</td>
						</tr>
					</table>
					</c:if>	
					
					<c:if test="${position eq '지점장'}">
					<table id="table3_1">
						<tr id="tr11" >
							<th rowspan="3">신청</th>
							<th>지점장</th>
							<th rowspan="3">결재</th>
							<th>대표</th>
						</tr>
						<tr id="tr22">
							<td>${loginIdName}</td>
							<td>${top_manager }</td>
						</tr>
					</table>
					</c:if>	
				
				<div id="button_ch_sak">
					<button type="button" onclick="add()">추가</button>
					<button type="button" onclick="del()">삭제</button>
				</div>
				<table id="table2">
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input type="text" name="subject"/>
						</td >
					</tr>
					<tr>
						<th colspan="3">
							<input type="file" name="files" multiple="multiple"/>
						</th>
					</tr>
					<tr id="cols">
						<th>적요</th>
						<th>금액</th>
						<th>비고</th>
					</tr>
					<tr>
						<td><input type="text" name="briefs[]" id="td_inp"/></td>
						<td><input type="text" name="price[]" id="td_inp"/></td>
						<td><input type="text" name="note[]" id="td_inp"/></td>
					</tr>
				</table>
				
				<div id="button_sin_mok">
					<button id="sin">신청하기</button>
					<button type="button" id="mm"  onclick="location.href='approvalAllList.do'">임시저장</button>
					<button type="button" id="mok" onclick="location.href='approvalAllList.do'">목록</button>
				</div>
				<input type="hidden" name="emp_no" value="${loginId}"/>
				<input type="hidden" name="approval" value="지출결의서"/>
				<input type="hidden" name="state" value="대기"/>
				<input type="hidden" name="manager" value="${manager}"/>
				<input type="hidden" name="top_manager" value="${top_manager}"/>
				</form>
			</div>
		</div>	
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script type="text/javascript">

	var currentDate = new Date();
	var year = currentDate.getFullYear();
	var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // 월이 한 자리 수일 경우 앞에 0을 추가하여 두 자리로 만듦
	var day = ('0' + currentDate.getDate()).slice(-2); // 일이 한 자리 수일 경우 앞에 0을 추가하여 두 자리로 만듦
	
	var dateSpan = document.getElementById("date");
	dateSpan.textContent = year + "-" + month + "-" + day;

function add() {
	  var content = '';
	  content += '<tr>';
	  content += '<td><input type="text" name="briefs[]" id="td_inp" /></td>';
	  content += '<td><input type="text" name="price[]" id="td_inp" /></td>';
	  content += '<td><input otype="text" name="note[]" id="td_inp" /></td>';
	  content += '</tr>';
	  $('#table2').append(content);
	}
function del(){
	console.log("click");
	var lastRow = $('#table2 tr:last');
	  // 마지막 행의 마지막 컬럼을 삭제합니다
	  lastRow.remove();
}
</script>
</html>