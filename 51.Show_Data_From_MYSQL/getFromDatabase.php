<?php
require 'dbconnect/connect.php';

$result = mysqli_query($conn, "CALL get_purchased_view()");

$data = "<tr>
    <th>ID compra</th>
    <th>Comprador</th>
    <th>Producto</th>
    <th>Fecha de compra</th>
    <th>Fecha de envío</th>
    <th>Dirección de envío</th>
    <th>Cargo</th>
</tr>";

if ($result) {
    while ($row = mysqli_fetch_array($result)) {
        $data = $data .  "<tr><td>" . $row['ID'] . "</td>" .
            "<td>" . $row['Customer'] . "</td>" .
            "<td>" . $row['Product'] . "</td>" .
            "<td>" . $row['Purchased'] . "</td>" .
            "<td>" . $row['Shipped'] . "</td>" .
            "<td>" . $row['Shipped_to'] . "</td>" .
            "<td> $" . $row['Charged'] . "</td></tr>";
    }
    echo $data;
}
else{
    echo "Error obteniendo datos";
}
?>