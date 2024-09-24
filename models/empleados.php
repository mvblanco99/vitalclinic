<?php
    require_once '../connection/connection.php';

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
            } else {
                echo "Error al registrar empleado: " . $stmt->error;
            }
    
            // Cerrar la declaración
            $stmt->close();
            // Cerrar la conexión
            $this->conn->close();
    
            return $is_register;
        }  
    }