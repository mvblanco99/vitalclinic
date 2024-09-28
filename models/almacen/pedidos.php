<?php
    require_once '../../connection/connection.php';

    class PedidosModel extends Connection{

        private $conn;

        public function __construct(){
            $this->conn = $this->connect();
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

        public function registrar_pedido($cod_pedido="",$despachadores = [],$ruta="",$cant_unidades="") {

            session_start();
            $user = $_SESSION['user']['id_account'];

            // Iniciar la transacción
            $this->conn->begin_transaction();

            try {
                // Primera operación: INSERT en la tabla pedidos
                $sql_tabla_pedidos = "INSERT INTO pedidos (
                numero_pedido,
                id_ruta,
                fecha,
                cantidad_unidades,
                distribuidor_pedidos
                ) VALUES (?,?,NOW(),?,?)";

                  
                // Preparar la consulta
                $stmt = $this->conn->prepare($sql_tabla_pedidos);

                // Verificar si la preparación falló
                if ($stmt === false) {
                    throw new Exception("Error al preparar la consulta: " . $this->conn->error);
                }

                // Vincular parámetros
                $stmt->bind_param("ssss", $cod_pedido,$ruta,$cant_unidades,$user);

                // Ejecutar la consulta
                if (!$stmt->execute()) {
                    throw new Exception("Error al registrar en la tabla pedidos: " . $stmt->error);
                }

                //Buscamos el id del pedido que acabamos de registrar
                $data = $this->verificar_num_pedido($cod_pedido);

                $id_pedido = $data[0]['id_pedido'];

                // Segunda operación: Insert en tabla pedidos_d_r_e
                $sql_tabla_pedidos_d_r_e = "INSERT INTO pedidos_d_r_e (
                id_pedido,
                id_despachador
                ) VALUES (?,?)";

                // Preparar la consulta
                $stmt2 = $this->conn->prepare($sql_tabla_pedidos_d_r_e);

                // Verificar si la preparación falló
                if ($stmt2 === false) {
                    throw new Exception("Error al preparar la consulta: " . $this->conn->error);
                }

                foreach($despachadores as $despachador){
                    
                    // Vincular parámetros
                    $stmt2->bind_param("ss", $id_pedido,$despachador);

                    // Ejecutar la consulta
                    if (!$stmt2->execute()) {
                        throw new Exception("Error al registrar en la tabla pedidos: " . $stmt2->error);
                    }
                } 

                // Confirmar la transacción
                $this->conn->commit();
                return true;
            } catch (Exception $e) {
                // Revertir la transacción en caso de error
                $this->conn->rollback();
                echo "Transacción fallida: " . $e->getMessage();
                return false;
            }
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