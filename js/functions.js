function dataOutput() {
  $.ajax({
    type: "POST",
    url: "php/output.php",
    dataType: 'json',
    success: function(data) {
      var idArr         =   data['id'].split("&");
      var buyerIdArr    =   data['buyer_id'].split("&");
      var productIdArr  =   data['product_id'].split("&");
      var quantityArr   =   data['quantity'].split("&");
      var sumArr        =   data['sum'].split("&");

      var table = document.getElementById("data");
      table.innerHTML = ''; /*Очищаем таблицу от старых значений*/

      for (let i = idArr.length - 1; i >= 0 ; i--) {
        let tr = document.createElement('tr');
        tr.innerHTML = "<td>" + idArr[i] + "</td>" + "<td>" + buyerIdArr[i] + "</td>" + "<td>" + productIdArr[i] + "</td>" + "<td>" + quantityArr[i] + "</td>" + "<td>" + sumArr[i] + "</td>";
        table.prepend(tr);
      } 
    }
  });
};

$("#insert-btn").click(function() {
  var buyer_id    =   $("#insert-buyer-id").val();
  var product_id  =   $("#insert-product-id").val();
  var quantity    =   $("#insert-quantity").val();

  var dataString = 'buyer_id='+ buyer_id + '&product_id=' + product_id + '&quantity=' + quantity;

  // Запись в бд
  $.ajax({
    type: "POST",
    url: "php/insert.php",
    data: dataString,
  });

  // очистка input
  document.getElementById('insert-buyer-id').value = '';
  document.getElementById('insert-product-id').value = '';
  document.getElementById('insert-quantity').value = '';

  dataOutput();

  return true;
});

$("#delete-btn").click(function() {
  var id = $("#delete-id").val();

  var dataString = 'id='+ id;

  $.ajax({
    type: "POST",
    url: "php/delete.php",
    data: dataString,
  });

  // очистка input
  document.getElementById('delete-id').value = '';

  dataOutput();
  
  return true;
});

$("#update-btn").click(function() {
  var id = $("#update-id").val();

  var dataString = 'id='+ id;

  $.ajax({
    type: "POST",
    url: "php/exists.php",
    data: dataString,
    dataType: 'json',
    success: function(data) {
      if (data == 't') {
        new bootstrap.Modal(document.getElementById('modal-update-dialog')).show();
        var modalUpdateDialog = document.getElementById('modal-update-dialog');
        modalUpdateDialog.setAttribute("update-id", id);

        // очистка input
        document.getElementById('update-id').value = '';
      }
      else {
        alert("Error! There is no such record exist!");
      }
    }

  });
  
  return true;
});

$("#update-dialog-btn").click(function() {
  var modalUpdateDialog = document.getElementById('modal-update-dialog');
  // получаем старые значения из атрибутов
  var id = modalUpdateDialog.getAttribute("update-id");

  // получаем новые значения из input
  var new_buyer_id = $("#new-buyer-id").val();
  var new_product_id = $("#new-product-id").val();
  var new_quantity = $("#new-quantity").val();

  var dataString = 'id='+ id + '&new_buyer_id='+ new_buyer_id + '&new_product_id=' + new_product_id + '&new_quantity=' + new_quantity;

  $.ajax({
    type: "POST",
    url: "php/update.php",
    data: dataString,
    success: function() {
      alert("Success");
    },
    error: function() {
      alert("Unexpected error");
    }
  });

  modalUpdateDialog.removeAttribute("update-id");

  // очистка input
  document.getElementById('new-buyer-id').value = '';
  document.getElementById('new-product-id').value = '';
  document.getElementById('new-quantity').value = '';

  dataOutput();

  return true;
});