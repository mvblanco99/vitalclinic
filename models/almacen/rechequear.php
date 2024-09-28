<?php

require_once '../../connection/connection.php';

class RechequearPedidoModel extends Connection{

    private $conn;

    public function __construct(){
        $this->conn = $this->connect();
    }

    public function extraer_embalador_asignado(){
        session_start();
        $user = $_SESSION['user']['id_account'];

        $sql = "SELECT 
        id_embalador,
        nombre,
        apellido
        FROM mesa_rechequeadores
        inner join empleados on mesa_rechequeadores.id_embalador = empleados.id
        WHERE id_rechequeador = '$user'";
        $result = $this->conn->query($sql);

        // Devolver los resultados como un array JSON
        $data = array();
        if ($result->num_rows > 0) {
            // Output data of each row
            while($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
        }

        // Cerrar conexión
        //$this->conn->close();
        return $data;
    }

    public function verificar_num_pedido($num_pedido){
        $sql = "SELECT id_pedido FROM pedidos WHERE numero_pedido = '$num_pedido'";
        $result = $this->conn->query($sql);

        // Devolver los resultados como un array JSON
        $data = array();
        if ($result->num_rows > 0) {
            // Output data of each row
            while($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
        }

        // Cerrar conexión
        //$this->conn->close();
        return $data;
    }

    public function extraer_partes_pedido($num_pedido){

        //Verificamos que el numero de pedido es correcto
        $data = $this->verificar_num_pedido($num_pedido);

        $id_pedido = $data[0]['id_pedido'];

        $sql = "SELECT
        nombre,
        apellido,
        pedidos_d_r_e.id,
        pedidos_d_r_e.id_pedido,
        pedidos_d_r_e.id_rechequeador,
        pedidos_d_r_e.id_embalador,
        pedidos_d_r_e.fecha_rechequeado,
        id_despachador
        FROM 
        pedidos_d_r_e 
        inner join empleados
        on pedidos_d_r_e.id_despachador = empleados.id
        WHERE id_pedido = '$id_pedido' 
        ORDER BY pedidos_d_r_e.id";
        $result = $this->conn->query($sql);

        // Devolver los resultados como un array JSON
        $dataBusqueda = array();
        if ($result->num_rows > 0) {
            // Output data of each row
            while($row = $result->fetch_assoc()) {
                $dataBusqueda[] = $row;
            }
        }

        // Cerrar conexión
        //$this->conn->close();
        return $dataBusqueda;
    }

    public function rechequear_pedido($embalador="",$parts=[]){
        session_start();
        $user = $_SESSION['user']['id_account'];

        //Verificamos que el numero de pedido es correcto
        $data = $this->verificar_num_pedido($num_pedido);

        //En caso de que el numero de pedido este incorrecto regresamos array vacio
        if(count($data) == 0){
            return false;
        }

        $id_pedido = $data[0]['id_pedido'];

        // Consulta SQL
        $sql = "UPDATE pedidos set 
        rechequeador = ?,
        embalador = ?,
        fecha_rechequeo = NOW()
        WHERE id_pedido = ?";
        
        $is_register = false;

        // Preparar la consulta
        $stmt = $this->conn->prepare($sql);
        
        if ($stmt === false) {
            die('Error en la preparación de la consulta: ' . $this->conn->error);
        }

        // Vincular parámetros
        $stmt->bind_param("ssi", $user, $embalador, $id_pedido);

        // Ejecutar la consulta
        if ($stmt->execute()) {
            $is_register = true;
        }

        // Cerrar la declaración
        $stmt->close();
        // Cerrar la conexión
        // $this->conn->close();

        return $is_register;
    }   
}