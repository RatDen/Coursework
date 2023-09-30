<?php 
	$connect_string = "host=localhost port=5432 dbname='database 2.0' user=postgres password='1369'";
	$link = pg_connect($connect_string);

	$stmt = "SELECT * FROM transaction";
	pg_prepare($link,"selectAll", $stmt);
	$result = pg_execute($link,"selectAll", array());
	pg_close($link);

	if ($row = pg_fetch_assoc($result)) {
		$id 		= 	$row['id'];
		$buyer_id 	= 	$row['buyer_id'];
		$product_id = 	$row['product_id'];
		$quantity 	= 	$row['quantity'];
		$sum 		= 	$row['sum'];

		while ($row = pg_fetch_assoc($result)) {
			$id 		= 	$id 		. "&" . $row['id'];
			$buyer_id 	= 	$buyer_id 	. "&" . $row['buyer_id'];
			$product_id = 	$product_id . "&" . $row['product_id'];
			$quantity 	= 	$quantity 	. "&" . $row['quantity'];
			$sum 		= 	$sum 		. "&" . $row['sum'];  
		}
	}

	$change = array('id' => $id, 'buyer_id' => $buyer_id, 'product_id' => $product_id, 'quantity' => $quantity, 'sum' => $sum,);
	echo json_encode($change);
?>