<?php
include 'koneksi.php';
session_start(); 
?>

<!DOCTYPE html>
<html>
<head>
	<title>Menu Dashboard :: DOVER</title>
</head>
<body>
	<h3>Selamat Datang <?= $_SESSION['nama_lengkap']; ?></h3>
	<h3>Level Anda : <?= $_SESSION['level']; ?></h3>
	<h3>Silahkan pilih Menu Dibawah ini :</h3>

	<?php
	$qr = mysqli_query($k,"SELECT a.*, b.`nama_menu` FROM role_transaction a LEFT JOIN  menu b ON a.`id_menu`=b.`id_menu` WHERE a.`id_role`=$_SESSION[id_role] AND b.`child`=0 AND b.`menu_aktif`=1");
	while ($menuUtama = mysqli_fetch_array($qr)) {
		$child = mysqli_query($k,"SELECT a.*, b.`nama_menu` FROM role_transaction a LEFT JOIN  menu b ON a.`id_menu`=b.`id_menu` WHERE a.`id_role`=$_SESSION[id_role] AND b.`child`=$menuUtama[id_menu] AND b.`menu_aktif`=1");
		echo"
			<ul>
				<li>$menuUtama[nama_menu]</li>";
					if (mysqli_num_rows($child) > 0) {
						while($ch = mysqli_fetch_array($child)){ 
						echo "<ul>
								<li><a href='#'>$ch[nama_menu]</a></li>
								</ul>";
							}
					} 
			echo"</ul>";
	}
	?>
	<a href="logout.php">Logout</a>
</body>
</html>