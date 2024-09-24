<?php
    require_once '../../connection/connection.php';

    class PedidosModel extends Connection{

        private $conn;

        public function __construct(){
            $this->conn = $this->connect();
        }

        public function registrar_pedido($cod_pedido="",$empleado="",$ruta="",$cant_unidades="") {

            session_start();
            $user = $_SESSION['user']['id_account'];

            // Consulta SQL
            $sql = "INSERT INTO pedidos (
            numero_pedido,
            id_ruta,
            despachador,
            fecha,
            cantidad_unidades,
            distribuidor_pedidos
            ) VALUES (?,?,?,NOW(),?,?)";
            
            $is_register = false;
    
            // Preparar la consulta
            $stmt = $this->conn->prepare($sql);
            
            if ($stmt === false) {
                die('Error en la preparación de la consulta: ' . $this->conn->error);
            }
    
            // Vincular parámetros
            $stmt->bind_param("sssss", $cod_pedido,$ruta,$empleado,$cant_unidades,$user);
    
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
        
        public function extraer_data_rutas(){
            $sql = "SELECT * FROM rutas";

            $result = $this->conn->query($sql);

            // Devolver los resultados como un array JSON
            $data_rutas = array();
            if ($result->num_rows > 0) {
                // Output data of each row
                while($row = $result->fetch_assoc()) {
                    $data_rutas[] = $row;
                }
            }

            // Cerrar conexión
            //$this->conn->close();
            return $data_rutas;
        }
    }