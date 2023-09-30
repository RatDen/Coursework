<?php
	$connect_string = "host=localhost port=5432 dbname='database 2.0' user=postgres password='1369'";
	$link = pg_connect($connect_string);

	$id = $_POST['id'];

	$stmt = "SELECT EXISTS (SELECT * FROM transaction WHERE id = $1)";
	pg_prepare($link,"exists", $stmt);
	$result = pg_execute($link,"exists", array($id));
	pg_close($link);

	$arr = pg_fetch_assoc($result);
	$is_exists = $arr['exists'];

	echo json_encode($is_exists);
?>