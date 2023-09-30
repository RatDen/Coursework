<?php 
	$connect_string = "host=localhost port=5432 dbname='database 2.0' user=postgres password='1369'";
	$link = pg_connect($connect_string);

	$buyer_id = $_POST['buyer_id'];
	$product_id = $_POST['product_id'];
	$quantity = $_POST['quantity'];

	$getPriceQuery = "select price from product where id = $1";
	pg_prepare($link, "getPrice", $getPriceQuery);
	$price = pg_fetch_result(pg_execute($link, "getPrice", array($product_id)), 0);

	$stmt = "INSERT INTO transaction (buyer_id, product_id, quantity, sum) VALUES ($1 , $2, $3, $4)";
	pg_prepare($link,"insert", $stmt);
	pg_execute($link,"insert", array($buyer_id, $product_id, $quantity, $price * $quantity));

	pg_close($link);
?>