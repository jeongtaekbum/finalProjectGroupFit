<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>�ű����� ���� ���� �ۼ�</h3>
	<form action="empjoin.do" id="empjoin" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<input type="file" id="empPhoto" name="empNum"/>
			</tr>
			<tr>
				<th>*�系��ȣ</th>
				<td><input type="text" name="emp_no"/></td>
			</tr>
			<tr>
				<th>*��й�ȣ</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th>*�̸�</th>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<th>*����</th>
				<td>
					<input type="radio" value="��" name="gender"/>��
					<input type="radio" value="��" name="gender"/>��
				</td>
			</tr>
			<tr>
				<th>*�������</th>
				<td><input type="date" name="birth"/></td>
			</tr>
			<tr>
				<th>*����ó</th>
				<td><input type="text" name="phone"/></td>
			</tr>
			<tr>
				<th>*�̸���</th>
				<td><input type="email" name="email"/></td>
			</tr>
			<tr>
				<th>*������ȣ</th>
				<td>
					<select name="b_idx">
					    <option value="����1">����1</option>
					    <option value="����2">����2</option>
					    <option value="����3">����3</option>
					    <option value="����4">����4</option>
					</select>			
				</td>
			</tr>
			<tr>
				<th>*����</th>
				<td>
					<select name="position">
					    <option value="����">����</option>
					    <option value="������">������</option>
					    <option value="��ǥ">��ǥ</option>
					</select>			
				</td>
			</tr>
			<tr>
				<th>*���Ⱓ</th>
				<td><input type="date" name="conterm"/></td>
			</tr>
			<tr>
				<th>*��������</th>
				<td>
					<select name="status">
					    <option value="����">����</option>
					    <option value="����">����</option>
					    <option value="����">����</option>
					</select>			
				</td>
			</tr>
			<tr>
				<th>*�Ի�����</th>
				<td><input type="date" name="join_year"/></td>
			</tr>
			<input type="submit" value="���"/>
			<button type="button" onclick="location.href='./boardList.do'">���</button>	
		</table>
	</form>
</body>
<script>

</script>
</html>