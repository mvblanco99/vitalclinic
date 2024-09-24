<?php

class ConsultasRecurrentes{

    public function obtener_pedidos($start_date, $final_date){
        $sql = "SELECT COUNT(NUM_PEDIDO) AS TODOS_PED, # Obtenemos el candidato y su repetición
        SUM(UNIDADES) AS UNIDADES_T
        FROM pedidos
        WHERE fecha BETWEEN '$start_date' AND '$final_date'";
    
        $result = $this->conn->query($sql);
            
        // Devolver los resultados como un array JSON
        $total_pedidos = array();
        if ($result->num_rows > 0) {
            // Output data of each row
            while($row = $result->fetch_assoc()) {
                $total_pedidos[] = $row;
            }
        }

        return $total_pedidos;
    }
}
