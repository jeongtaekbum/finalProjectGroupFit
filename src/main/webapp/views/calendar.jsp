<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8' />
  <title>calendar</title>
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
  <link href='/packages/core/main.css' rel='stylesheet' />
  <link href='/packages/daygrid/main.css' rel='stylesheet' />
  <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' rel='stylesheet'><!-- Bootstrap CSS 추가 -->
  <link href='/packages/list/main.css' rel='stylesheet' />
  <link href='/packages/timegrid/main.css' rel='stylesheet' />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src='/packages/core/main.js'></script>
  <script src='/packages/interaction/main.js'></script>
  <script src='/packages/daygrid/main.js'></script>
  <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script><!-- Bootstrap JavaScript 추가 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  <script src='/packages/list/main.js'></script>
  <script src='/packages/timegrid/main.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  <style>
    body {
	  margin: 40px 10px;
	  padding: 0;
	  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	  font-size: 14px;
	}
	.fc-day-header {
	  background-color: black;
	  color: white;
	}

    #calendar {
      max-width: 900px;
      margin: 0 auto;
    }

    .fixed-top-button {
      position: fixed;
      top: 10px;
      left: 50%;
      transform: translateX(-50%);
    }
    .fc-event {
      cursor: pointer;
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
						<h1>calendar</h1>
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
				  <button onclick="openModal()">일정 등록</button>
				  <!-- <button onclick="ck()">이벤트 확인</button> -->
				
				  <div id='calendar'></div>
				
				  <!-- 등록 버튼 모달 창 -->
				  <div class="modal fade" id="event-modal" tabindex="-1" role="dialog" aria-labelledby="event-modal-label">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          <h5 class="modal-title" id="event-modal-label">일정 등록</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        <div class="modal-body">
				          <!-- 일정 등록 폼 -->
				          <form id="event-form">
				            <div class="form-group">
				              <label for="event-name">회원 이름</label>
				              <input type="text" class="form-control" id="event_name" name="event_name" placeholder="이름을 입력하세요">
				            </div>
				
				            <!-- 시작 시간 입력 필드 -->
				            <div class="form-group">
				              <label for="start-datetime">시작 시간</label>
				              <input id="start_time" type="datetime-local" class="form-control" name="start_time">
				            </div>
				
				            <!-- 종료 시간 입력 필드 -->
				            <div class="form-group">
				              <label for="end-datetime">종료 시간</label>
				              <input id="end_time" type="datetime-local" class="form-control" name="end_time">
				            </div>
				          </form>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				          <button type="button" class="btn btn-primary" id="save-event-btn">저장</button>
				        </div>
				      </div>
				    </div>
				  </div>
				
				  <!-- 상세보기 모달 창 -->
				<div class="modal fade" id="event-detail-modal" tabindex="-1" role="dialog" aria-labelledby="event-detail-modal-label">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="event-detail-modal-label">일정 상세보기</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <!-- 일정 상세 정보 -->
				        <div id="event-detail-info">
				          <div class="form-group">
				            <label for="event-detail-title">회원 이름</label>
				            <input type="text" class="form-control" id="event-detail-title" readonly>
				          </div>
				          <div class="form-group">
				            <label for="event-detail-start">시작 시간</label>
				            <input type="text" class="form-control" id="event-detail-start" readonly>
				          </div>
				          <div class="form-group">
				            <label for="event-detail-end">종료 시간</label>
				            <input type="text" class="form-control" id="event-detail-end" readonly>
				          </div>
				        </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" id="edit-event-btn">수정</button>
				        <button type="button" class="btn btn-danger" id="delete-event-btn">삭제</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				
				
				<!-- 수정 모달 -->
				<div id="edit-event-modal" class="modal" tabindex="-1">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">수정하기</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <!-- 수정 폼 -->
				        <form id="edit-event-form">
				          <!-- 수정할 이벤트 정보 입력 필드 -->
				          <div class="form-group">
				            <label for="edit-event-title">제목</label>
				            <input type="text" class="form-control" id="edit-event-title" placeholder="제목 입력">
				          </div>
				          <div class="form-group">
				            <label for="edit-event-start">시작 시간</label>
				            <input type="datetime-local" class="form-control" id="edit-event-start" placeholder="시작 시간 입력">
				          </div>
				          <div class="form-group">
				            <label for="edit-event-end">종료 시간</label>
				            <input type="datetime-local" class="form-control" id="edit-event-end" placeholder="종료 시간 입력">
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" id="cancel-edit-event-btn" data-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-primary" id="submit-edit-event-btn">수정하기</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				
				
				  <script>
				    var calendar = null;
				    
					// 상세보기랑 수정
				    $(document).ready(function() {
				    	  var calendarEl = document.getElementById('calendar');
				    	  var eventId; // eventId 변수를 상위 스코프에서 선언
				    	  var eventStart;
				    	  var eventEnd;
				    	  
				    	  calendar = new FullCalendar.Calendar(calendarEl, {
				    	    plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
				    	    defaultDate: new Date(),
				    	    editable: false,
				    	    eventLimit: true,
				    	    events: [],
				    	    eventClick: function(info) {
				    	      // 클릭한 이벤트의 정보를 변수에 저장
				    	      eventId = info.event.id;
				    	      var eventTitle = info.event.title;
				    	      eventStart = info.event.start || new Date(); // 유효한 값을 가지도록 초기화, 같은 값을 가지면 null 값 들어가서 오류
				    	      eventEnd = info.event.end || new Date(); // 유효한 값을 가지도록 초기화

				    	      // 시간 형식 설정
				    	      // 상세보기에 시, 분 만 보이도록
				    	      var startTime = eventStart.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
				    	      var endTime = eventEnd.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

				    	      // 이벤트 정보를 상세보기 모달에 표시
				    	      $('#event-detail-title').val(eventTitle);
				    	      $('#event-detail-start').val(startTime);
				    	      $('#event-detail-end').val(endTime);

				    	      // 상세보기 모달을 엽니다.
				    	      $('#event-detail-modal').modal('show');

				    	      // 수정하기 버튼 클릭 시
				    	      $('#edit-event-btn').on('click', function() {
				    	    	  
				    	    	  
				    	        // 수정 정보를 상세보기 모달에서 가져옵니다.
				    	        // title.val 은 변경한거 없으니까 그냥 가져오고
				    	        var editEventTitle = $('#event-detail-title').val();
				    	        //var editEventStart = $('#event-detail-start').val();
				    	        //var editEventEnd = $('#event-detail-end').val();

				    	        /* // 수정 모달에 정보를 설정합니다.
				    	        $('#edit-event-title').val(editEventTitle);
				    	        $('#edit-event-start').val(eventStart);
				    	        $('#edit-event-end').val(eventEnd); */
				    	     // 기존 이벤트의 시작 시간과 종료 시간을 datetime-local 입력 필드에 설정합니다.
				    	     	
				    	     	// start는 캘린더에 맞게 변경하고
				    	        var startTime = eventStart.toISOString().slice(0, 16); // YYYY-MM-DDTHH:MM 형식으로 변환
				    	        var endTime = eventEnd.toISOString().slice(0, 16); // YYYY-MM-DDTHH:MM 형식으로 변환
				    	        $('#edit-event-start').val(startTime);
				    	        $('#edit-event-end').val(endTime);

				    	        // 수정 모달에 정보를 설정합니다.
				    	        $('#edit-event-title').val(editEventTitle);

				    	        // 상세보기 모달을 닫습니다.
				    	        $('#event-detail-modal').modal('hide');

				    	        // 수정 모달을 엽니다.
				    	        $('#edit-event-modal').modal('show');
				    	        
				    	     	// 수정하기 모달의 취소 버튼 클릭 시
				    	        $('#cancel-edit-event-btn, #edit-event-modal .close').on('click', function() {
				    	          // 수정 모달을 닫습니다.
				    	          $('#edit-event-modal').modal('hide');
				    	        });
				    	      });
				    	    }
				    	  });

				    	  calendar.render();

				    	  // 모달 닫기 버튼 클릭 시
				    	  $(document).on('click', '#event-detail-modal .close, #event-detail-modal .modal-footer .btn-secondary', function() {
				    	    $('#event-detail-modal').modal('hide');
				    	  });

				    	  // 등록 모달 닫기 버튼 클릭 시
				    	  $(document).on('click', '#event-modal .close, #event-modal .modal-footer .btn-secondary', function() {
				    	    $('#event-modal').modal('hide');
				    	  });

				    	  // 수정하기 버튼 클릭 시
				    	  $('#submit-edit-event-btn').on('click', function() {
				    		  

				    	    // 수정 정보를 서버로 전송합니다.
				    	    $.ajax({
				    	      url: '/updatecalendar', // 수정 정보를 전송할 서버 엔드포인트 URL을 입력하세요.
				    	      method: 'POST',
				    	      data: {
				    	        id: eventId,
				    	        title: $('#edit-event-title').val(),
				    	        start: $('#edit-event-start').val(),
				    	        end: $('#edit-event-end').val()
				    	      },
				    	      success: function(response) {
				    	        // 성공적으로 수정되었을 경우 수행할 동작을 추가하세요.
				    	        console.log('Event updated successfully!');
				    	        // 예: 모달 닫기, 캘린더 새로고침 등
				    	        // 수정 모달을 닫습니다.
				    	        $('#edit-event-modal').modal('hide');
				    	        location.reload();

				    	        
					    	      },
				    	      error: function(e) {
				    	        // 수정 실패 시 수행할 동작을 추가하세요.
				    	        console.error(e);
				    	        // 예: 오류 메시지 표시 등
				    	      }
				    	      
				    	    });
				    	  });
				    	});
				 

				    function openModal() {
				      $('#event-modal').modal('show');
				    }
				
				    // 콘솔에서 이벤트 확인
				    function ck() {
				      console.log(calendar.getEvents());
				      var events = calendar.getEvents();
				      events.forEach(function(event) {
				        console.log("Title:", event.title);
				        console.log("Start Time:", event.start);
				        console.log("End Time:", event.end);
				      });
				    }
				    
				    
				    
					// 일정 등록이요
				    // 저장 버튼 클릭 시 이벤트 처리
				    $(document).on('click', '#save-event-btn', function() {
				      // 데이터 추출
				      var eventName = $('#event_name').val();
				      var startDateTime = $('#start_time').val();
				      var endDateTime = $('#end_time').val();
				      console.log(eventName);
				
				      // 생성할 이벤트 데이터
				      var eventData = { 
				        title: eventName,
				        start: startDateTime,
				        end: endDateTime
				      };
				
				      // AJAX 요청
				      $.ajax({
				        type: 'POST',
				        url: '/events',
				        data: eventData,
				        success: function(response) {
				          console.log("일정 등록 성공");
				          calendar.addEvent(eventData);
				          $('#event-modal').modal('hide');
				        },
				        error: function(e) {
				          console.log(e);
				        }
				      });
				    });
				    
				    

				    
				    // 캘린더 일정 캘린더에 보여주기요
				    $(document).ready(function() {
				      // 서버에서 캘린더 데이터 가져오기
				      $.ajax({
				        url: "/calendarList",
				        type: "GET",
				        dataType: "json",
				        success: function(data) {
				          console.log(data);
				          $.each(data.calendarlist, function(index, item) {
				            var dt_start = new Date(item.start_time);
				            var dt_end = new Date(item.end_time);
				            console.log(dt_start, dt_end);
				
				            var newEvent = {
				              title: item.event_name,
				              start: dt_start.toISOString(),
				              end: dt_end.toISOString(),
				              id: item.calendar_no // 각 이벤트의 고유 ID를 설정하여 식별합니다.
				            };
				            console.log(newEvent);
				            
				            calendar.addEvent(newEvent);
				          });
				
				          calendar.render();
				        },
				        error: function(e) {
				          console.log(e);
				        }
				      });
				    });
				 

				    // 삭제 버튼 클릭 시
				    $(document).on('click', '#delete-event-btn', function() {
				      // 여기에 삭제 버튼을 클릭했을 때 수행할 동작을 추가하세요.
				      // 예: 해당 이벤트를 삭제하거나, 삭제 관련 작업을 수행합니다.
				    });
				    
				    
				    $(document).ready(function() {
				    	  // 등록 모달 창이 닫힐 때 입력 필드 초기화
				    	  $('#event-modal').on('hidden.bs.modal', function() {
				    	    $('#event-form')[0].reset();
				    	  });
				    	});
				    

				
				    
				    
				  </script>
					</div>
					<!--/. container-fluid -->
				</section>
			</div>


</body>
</html>