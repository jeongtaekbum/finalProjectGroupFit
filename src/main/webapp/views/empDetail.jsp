<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>���� ������ �󼼺���</h3>
	<form action="empUpdate.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<input type="file" name="emp_photo"/>
			</tr>
			<tr>
				<th>*�系��ȣ</th>
				<td><input type="text" name="emp_no" value="${emp.emp_no }" readonly/></td>
			</tr>
			<tr>
				<th>*��й�ȣ</th>
				<td><input type="text" name="pw" value="${emp.pw}" readonly/></td>
			</tr>
			<tr>
				<th>*�̸�</th>
				<td><input type="text" name="name" value="${emp.name}" readonly/></td>
			</tr>
			<tr>
				<th>*����</th>
				<td>
					<input type="radio" value="��" name="gender"
					<c:if test="${emp.gender eq '��'}">checked</c:if>
					 readonly/>��
					
					<input type="radio" value="��" name="gender"
					<c:if test="${emp.gender eq '��'}">checked</c:if>
					 readonly/>��
				</td>
			</tr>
			<tr>
				<th>*�������</th>
				<td><input type="text" name="birth" value="${emp.birth}" readonly/></td>
			</tr>
			<tr>
				<th>*����ó</th>
				<td><input type="text" name="phone" value="${emp.phone}" readonly/></td>
			</tr>
			<tr>
				<th>*�̸���</th>
				<td><input type="email" name="email" value="${emp.email}" readonly/></td>
			</tr>
			<tr>
				<th>*������ȣ</th>
				<td><input type="text" name="b_idx" value="${emp.b_idx}" readonly/></td>
			</tr>
			<tr>
				<th>*����</th>
				<td><input type="text" name="position" value="${emp.position}" readonly/></td>
			</tr>
			<tr>
				<th>*���Ⱓ</th>
				<td><input type="text" name="conterm" value="${emp.conterm}" readonly/></td>
			</tr>
			<tr>
				<th>*��������</th>
				<td><input type="text" name="status" value="${emp.status}" readonly/></td>
			</tr>
			<tr>
				<th>*�Ի�����</th>
				<td><input type="text" name="join_year" value="${emp.join_year}" readonly/></td>
			</tr>
			<input type="submit" value="����"/>
			<button type="button" onclick="location.href='./list.do'">���</button>	
			<button type="button" onclick="location.href='./boardList.do'">����</button>	
		</table>
	</form>
</body>
<script>

</script>
</html>