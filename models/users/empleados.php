<?php
    require_once '../../connection/connection.php';

    class EmpleadosModel extends Connection{

        private $conn;

        public function __construct(){
            $this->conn = $this->connect();
        }

        public function registrar_empleado($cedula = "", $name = "", $lastname = "") {
            // Consulta SQL
            $sql = "INSERT INTO empleados (cedula, nombre, apellido) VALUES (?, ?, ?)";
            
            $is_register = false;
    
            // Preparar la consulta
            $stmt = $this->conn->prepare($sql);
            
            if ($stmt === false) {
                die('Error en la preparación de la consulta: ' . $this->conn->error);
            }
    
            // Vincular parámetros
            $stmt->bind_param("sss", $cedula, $name, $lastname);
    
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
        
        public function extraer_datos_empleados(){
            $sql = "SELECT * FROM empleados WHERE status=1";

            $result = $this->conn->query($sql);

            // Devolver los resultados como un array JSON
            $data_users = array();
            if ($result->num_rows > 0) {
                // Output data of each row
                while($row = $result->fetch_assoc()) {
                    $data_users[] = $row;
                }
            }

            // Cerrar conexión
            //$this->conn->close();
            return $data_users;
        }

        public function extraer_datos_accounts(){
            $sql = "SELECT * FROM accounts WHERE status=1";

            $result = $this->conn->query($sql);

            // Devolver los resultados como un array JSON
            $data_users = array();
            if ($result->num_rows > 0) {
                // Output data of each row
                while($row = $result->fetch_assoc()) {
                    $data_users[] = $row;
                }
            }

            // Cerrar conexión
            //$this->conn->close();
            return $data_users;
        }

        public function extraer_datos_roles(){
            $sql = "SELECT * FROM roles WHERE roles.id != 1 order by id";

            $result = $this->conn->query($sql);

            // Devolver los resultados como un array JSON
            $data_roles = array();
            if ($result->num_rows > 0) {
                // Output data of each row
                while($row = $result->fetch_assoc()) {
                    $data_roles[] = $row;
                }
            }

            // Cerrar conexión
            //$this->conn->close();
            return $data_roles;
        }

        public function registrar_usuario($empleado = "", $username = "", $password = "", $role = "") {
            // Consulta SQL
            $sql = "INSERT INTO accounts (id_empleado, username, password, role_id) VALUES (?, ?, ?, ?)";
            
            $is_register = false;
    
            // Preparar la consulta
            $stmt = $this->conn->prepare($sql);
            
            if ($stmt === false) {
                die('Error en la preparación de la consulta: ' . $this->conn->error);
            }
    
            // Vincular parámetros
            $stmt->bind_param("ssss", $empleado, $username, $password, $role);
    
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

        public function buscar_empleado($cedula=""){
            $sql = "SELECT * FROM empleados WHERE cedula = '$cedula'";

            $result = $this->conn->query($sql);

            // Devolver los resultados como un array JSON
            $data_user = array();
            if ($result->num_rows > 0) {
                // Output data of each row
                while($row = $result->fetch_assoc()) {
                    $data_user[] = $row;
                }
            }

            // Cerrar conexión
            //$this->conn->close();
            return $data_user;
        }

        public function modificar_empleado($id="",$cedula="",$name="",$lastname="",$status=""){
              // Consulta SQL
              $sql = "UPDATE empleados SET
              cedula = ?,
              nombre = ?, 
              apellido = ?,
              status = ?
              WHERE id = ?";
            
              $is_register = false;
      
              // Preparar la consulta
              $stmt = $this->conn->prepare($sql);
              
              if ($stmt === false) {
                  die('Error en la preparación de la consulta: ' . $this->conn->error);
              }
      
              // Vincular parámetros
              $stmt->bind_param("sssss",$cedula,$name,$lastname,$status,$id);
      
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