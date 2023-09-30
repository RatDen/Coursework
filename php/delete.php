<?php 
	$connect_string = "host=localhost port=5432 dbname='database 2.0' user=postgres password='1369'";
	$link = pg_connect($connect_string);

	$id = $_POST['id'];

	$stmt = "DELETE FROM transaction WHERE id = $1";
	pg_prepare($link,"delete", $stmt);
	pg_execute($link,"delete", array($id));

	pg_close($link);
?>