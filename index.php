<!DOCTYPE html>
<html>
<head>
	<title>Login :: DOVER</title>
	<style type="text/css">
		body{
			margin-top: 100px;
		}
		td{
			padding: 10px;
		}
		.warning{
			color: red;
			text-align: center;
		}
	</style>
</head>
<body>
<form method="POST" action="">
<table align="center" border="0" width="20%" >
	
	<tr>
		<td colspan="3" align="center">:: SILAHKAN LOGIN ::</td>
	</tr>
	<tr>
		<td>Username</td>
		<td>:</td>
		<td><input type="text" name="user" autocomplete="off" required></td>
	</tr>
	<tr>
		<td>Password</td>
		<td>:</td>
		<td><input type="password" name="pass" autocomplete="off" required></td>
	</tr>
	<tr>
		<td colspan="3" align="center"><button name="login" type="submit" >LOGIN</button></td>
	</tr>
</table>
</form>
<?php
if (isset($_POST['login'])) {
	include 'koneksi.php';
	session_start();
	extract($_POST);
	$cek = mysqli_query($k,"SELECT * FROM user WHERE username='$user' AND password='$pass'");
	if (mysqli_num_rows($cek) > 0) {
		$data = mysqli_fetch_array($cek);
		$_SESSION['nama_lengkap'] = $data['nama_lengkap'];
		$_SESSION['level'] = $data['level'];
		$_SESSION['id_role'] = $data['id_role'];
		header('Location: dashboard.php');
	}else{
		echo "<p class='warning' >Username dan Password Tidak Ditemukan</p>";
	}	


}

?>

</body>
</html>