<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pt 회원 일지</title>
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
<style>
  .form-group {
        display: flex;
        flex-direction: row;
        align-items: center;
        margin-bottom: 10px;
    }

    .form-group label {
        flex: 1;
        white-space: nowrap;
        margin-right: 10px;
    }

    .form-group input[type="text"],
    .form-group input[type="number"],
    .form-group input[type="date"],
    .form-group textarea {
        flex: 2;
        background-color: transparent;
        border: 1px solid white;
        color: white; /* 글자 색상을 하얀색(흰색)으로 설정 */
    }

    .add-exercise-container {
        flex: 1;
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }

    .add-exercise-button {
        margin-left: 10px;
        margin-right: 0;
    }

    .aerobic-exercise,
    .diet-journal,
    .remarks {
        width: 100%;
        min-height: 150px;
        background-color: transparent; /* 투명 배경색 */
        border: 1px solid white; /* 테두리 스타일 유지 */
        color: white; /* 글자 색상을 하얀색(흰색)으로 설정 */
    }
    
    .container {
        max-width: 800px;
        margin: 0 auto;
    }
    
    
	.aerobic-exercise,
	.diet-journal,
	.remarks {
	    width: 100%;
	    min-height: 200px;
	    max-height: 300px;
	    overflow-y: auto;
	    background-color: transparent;
	    border: 1px solid white;
	    color: white;
	    resize: none;
	}
	
	.submit-button {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.submit-button button {
    margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1></h1>
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
				
   
				    <div class="container">

				    
					    <div style="display: flex; justify-content: space-between; align-items: center;">
					        <h3 style="margin: 0;">회원pt일지 상세보기</h3>

					        <br>
					        
					        <div class="form-group" style="margin-bottom: 0; display: flex; align-items: center;">
					            <label for="date">날짜 : </label>
					            <input type="date" id="date" name="date" value="${dto.pt_date}" readonly> 
					        </div>
					        
					    </div>
					           
				            <hr>
				            <!-- 회원 정보 -->
				            <div class="form-group">

				                <label for="memberNumber">회원 번호 : </label>
				                <input type="text" id="mem_no" name="mem_no" value="${dto.mem_no}" readonly>
				                
				                <label for="name">이름 : </label>
				                <input type="text" id="name" name="name" value="${dto.member_name}" readonly>
				                
				                <label for="weight">몸무게 : </label>
				                <input type="number" id="af_weight" name="af_weight" value="${dto.af_weight}" readonly>
				            </div>
				
				            <hr>
				            

				              <h5 >웨이트 운동</h5>
				              <div id="weightExerciseContainer">
						          	
						          <div class="form-group">
								        <label for="weightExerciseName">운동명 : </label>
								        <input type="text" id="pt_name1" name="pt_name[]" value="${weightList[0].pt_name}" readonly>

								        <label for="setCount">무게 : </label>
								        <input type="number" id="pt_kg1" name="pt_kg[]" value="${weightList[0].pt_kg}" readonly>

								        <label for="repCount">SET수 : </label>
								        <input type="number" id="pt_set1" name="pt_set[]" value="${weightList[0].pt_set}" readonly>
								         
    
								    </div>
													           
						           <!-- 추가된 운동 정보를 가져와서 폼을 생성 -->
								      <c:forEach var="weight" items="${weightList}" begin="1" varStatus="loop">
								        <div class="form-group">
								            <label for="weightExerciseName">운동명 : </label>
								            <input type="text" id="pt_name${loop.index + 1}" name="pt_name[]" value="${weight.pt_name}" readonly>
								   
								            <label for="setCount">무게 : </label>
								            <input type="number" id="pt_kg${loop.index + 1}" name="pt_kg[]" value="${weight.pt_kg}" readonly>

								            <label for="repCount">SET수 : </label>
								            <input type="number" id="pt_set${loop.index + 1}" name="pt_set[]" value="${weight.pt_set}" readonly>
								          
								        </div>
								    </c:forEach>
						    </div>
				
				            <hr>
				
				           <!-- 유산소 운동 -->
                    <h5>유산소 운동</h5>
                    <br>
                    <div class="form-group"> 
                        <textarea id="aerobic" name="aerobic" class="aerobic-exercise" readonly>${dto.aerobic}</textarea>
                    </div>

                    <hr>

                    <!-- 식단 일지 -->
                    <h5>식단 일지</h5>
                    <br>
                    <div class="form-group">
                        
                        <textarea id="diet" name="diet" class="diet-journal" readonly>${dto.diet}</textarea>
                    </div>

                    <hr>

                    <!-- 특이 사항 -->
                    <h5>특이 사항</h5>
                    <br>
                    <div class="form-group">
                        <textarea id="etc" name="etc" class="remarks" readonly>${dto.str}</textarea>
                    </div>

                    <hr>
                    
					<div class="submit-button">
					<c:if test="${sessionScope.loginEmp.position eq '트레이너' }">
	                    <button type="submit"  class="btn btn-primary" onclick="location.href='./dailyptUpdate.go?dailypt_no=${dto.dailypt_no}'">수정</button>
	                    <button type="submit" class="btn btn-danger" onclick="location.href='./dailyptdelete.do?dailypt_no=${dto.dailypt_no}'">삭제</button>
	                </c:if>
	                    <button type="submit" class="btn btn-primary" onclick="location.href='./dailyptt'" >리스트</button>
	                </div>
	                
				    <br>
				
				    </div>
				
				
							</div>
							<!--/. container-fluid -->
						</section>
					</div>
				</body>
<script>











</script>
</html>