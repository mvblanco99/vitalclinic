<?php
    include "../models/empleados.php";

    class EmpleadosController{

        public function registrar_empleado($cedula="",$name="",$lastname=""){

            //VALIDAR DATA
            $model = new EmpleadosModel();
            $data = $model->registrar_empleado($cedula,$name,$lastname);
            return $data;
        }

    }

    if(isset($_GET['registrar_empleado'])){
        $cedula = $_POST['cedula'];
        $name = $_POST['name'];
        $lastname = $_POST['lastname'];
    
        $registro = new EmpleadosController();
        $data = $registro->registrar_empleado($cedula,$name,$lastname);
        echo json_encode($data);
    }

