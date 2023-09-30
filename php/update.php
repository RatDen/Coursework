<?php 
	$connect_string = "host=localhost port=5432 dbname='database 2.0' user=postgres password='1369'";
	$link = pg_connect($connect_string);

	$id = $_POST['id'];
	$new_buyer_id = $_POST['new_buyer_id'];
	$new_product_id = $_POST['new_product_id'];
	$new_quantity = $_POST['new_quantity'];

	$getPriceQuery = "select price from product where id = $1";
	pg_prepare($link, "getPrice", $getPriceQuery);
	$price = pg_fetch_result(pg_execute($link, "getPrice", array($new_product_id)), 0);

	$stmt = "UPDATE transaction
			 SET buyer_id = $1, product_id = $2, quantity = $3, sum = $4
			 WHERE id = $5;";

	pg_prepare($link,"update", $stmt);
	pg_execute($link,"update", array($new_buyer_id, $new_product_id, $new_quantity, ($new_quantity * $price), $id));

	pg_close($link);
?>