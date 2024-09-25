<?php
    require_once '../../connection/connection.php';


    class FallasModel extends Connection{

        private $conn;

        public function __construct(){
            $this->conn = $this->connect();
        }

        public function extraer_motivos_fallas(){
            $sql = "SELECT * FROM motivo_fallas";

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

        public function registrar_fallas($num_pedido="", $motivo="", $descripcion=""){
            
            //Verificamos que el numero de pedido es correcto
            $data = $this->verificar_num_pedido($num_pedido);

            //En caso de que el numero de pedido este incorrecto regresamos array vacio
            if(count($data) == 0){
                return false;
            }

            $id_pedido = $data[0]['id_pedido'];

            // Consulta SQL
            $sql = "INSERT INTO fallas (
            id_pedido,
            motivo,
            descripcion,
            fecha
            ) VALUES (?,?,?,NOW())";
            
            $is_register = false;
    
            // Preparar la consulta
            $stmt = $this->conn->prepare($sql);
            
            if ($stmt === false) {
                die('Error en la preparación de la consulta: ' . $this->conn->error);
            }
    
            // Vincular parámetros
            $stmt->bind_param("sss", $id_pedido,$motivo,$descripcion);
    
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