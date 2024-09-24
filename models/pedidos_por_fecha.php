<?php

include '../connection/connection.php';

class PedidosPorFechaModel extends Connection{

    private $conn;

    public function __construct(){
        $this->conn = $this->connect();
    }

    public function obtener_rutas(){
        $sql = "SELECT ID,RUTA FROM RUTAS ORDER BY RUTA ASC";
        $result = $this->conn->query($sql);
        // Devolver los resultados como un array JSON
        $rutas = array();
        if ($result->num_rows > 0) {
            // Output data of each row
            while($row = $result->fetch_assoc()) {
                $rutas[] = $row;
            }
        }
        return $rutas;
    }

    public function obtener_pedidos_por_ruta($start_date = "", $final_date = "", $ruta = ""){
        
        $sql= "SELECT * from pedidos  
        where ruta = '$start_date' and fecha BETWEEN '$final_date' AND '$ruta'";

        $result = $this->conn->query($sql);
        
    
        // Devolver los resultados como un array JSON
        $desgloce_pedidos = array();

        if ($result->num_rows > 0) {
            // Output data of each row
            while($row = $result->fetch_assoc()) {
                $desgloce_pedidos[] = $row;
            }
        }
        
        return $desgloce_pedidos;
    }

    public function obtener_total_pedidos_por_ruta($start_date = "", $final_date = "", $ruta = ""){
        $sql = "SELECT 
        COUNT(NUM_PEDIDO) AS TODOS_PED, 
        SUM(UNIDADES) AS UNIDADES_T
        FROM pedidos
        WHERE ruta='$ruta' and fecha BETWEEN '$start_date' AND '$final_date'";	

        // Devolver los resultados como un array JSON
        $total_pedidos = array();

        if ($result->num_rows > 0) {
            // Output data of each row
            while($row = $result2->fetch_assoc()) {
                $total_pedidos[] = $row;
            }
        }

        return $total_pedidos;
    }
}