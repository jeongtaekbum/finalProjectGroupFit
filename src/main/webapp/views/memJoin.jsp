<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="memjoin.do" method="post">
		<table>
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<th>�������</th>
				<td><input type="text" name="birth"/></td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><input type="text" name="phone"/></td>
			</tr>
			<tr>
				<th>������ȣ</th>
				<td><input type="text" name="user_number"/></td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td><input type="email" name="email"/></td>
			</tr>
			<tr>
				<th>�������</th>
				<td>
					 <label for="lang">Language</label>
					  <select name="languages" id="lang">
					    <option value="javascript">JavaScript</option>
					    <option value="php">PHP</option>
					    <option value="java">Java</option>
					    <option value="golang">Golang</option>
					    <option value="python">Python</option>
					    <option value="c#">C#</option>
					    <option value="C++">C++</option>
					    <option value="erlang">Erlang</option>
					  </select>
				</td>
			</tr>
			<tr>
				<th>�����</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th>����</th>
				<td>
					<input type="radio" value="��" name="gender"/>��
					<input type="radio" value="��" name="gender"/>��
				</td>
			</tr>
			<tr>
				<th>��Ŀ��뿩��</th>
				<td>
					<input type="radio" value="��" name="gender"/>��
					<input type="radio" value="��" name="gender"/>��
				</td>
			</tr>
			<tr>
				<th>�����뿩��</th>
				<td>
					<input type="radio" value="��" name="gender"/>��
					<input type="radio" value="��" name="gender"/>��
				</td>
			</tr>
			<tr>
				<th>�̿�ǱⰣ</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th>�����ݾ�</th>
				<td><input type="password" name="pw"/></td>
			</tr>
		</table>
		<button>ȸ������</button>
	</form>


</body>
</html>