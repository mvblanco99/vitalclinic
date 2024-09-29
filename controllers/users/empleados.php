<?php
    include "../../models/users/empleados.php";

    class EmpleadosController{

        public function registrar_empleado($cedula="",$name="",$lastname=""){
            //VALIDAR DATA
            $model = new EmpleadosModel();
            $data = $model->registrar_empleado($cedula,$name,$lastname);
            return $data;
        }


        public function registrar_usuario($empleado="",$username="",$password="",$role=""){
            //VALIDAR DATA
            $model = new EmpleadosModel();
            $data = $model->registrar_usuario($empleado,$username,$password,$role);
            return $data;
        }

        public function modificar_empleado($id="",$cedula="",$name="",$lastname="",$status=""){
            //VALIDAR DATA
            $model = new EmpleadosModel();
            $data = $model->modificar_empleado($id,$cedula,$name,$lastname,$status);
            return $data;
        }

        public function buscar_empleado($cedula=""){
            //VALIDAR DATA
            $model = new EmpleadosModel();
            $data = $model->buscar_empleado($cedula);
            return $data;
        }

        public function extraer_data_empleados(){
            $model = new EmpleadosModel();
            $data = $model->extraer_datos_empleados();
            return $data;
        }

        public function extraer_data_accounts(){
            $model = new EmpleadosModel();
            $data = $model->extraer_datos_accounts();
            return $data;
        }

        public function extraer_datos_roles(){
            $model = new EmpleadosModel();
            $data = $model->extraer_datos_roles();
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
    
    if(isset($_GET['registrar_usuario'])){
        $empleado = $_POST['empleado'];
        $username = $_POST['username'];
        $password = $_POST['password'];
        $role = $_POST['role'];
    
        $registro = new EmpleadosController();
        $data = $registro->registrar_usuario($empleado,$username,$password,$role);
        echo json_encode($data);
    }

    if(isset($_GET['modificar_empleado'])){
        $cedula = $_POST['cedula'];
        $name = $_POST['name'];
        $lastname = $_POST['lastname'];
        $id = $_POST['id'];
        $status = $_POST['status'];
    
        $controller = new EmpleadosController();

        $data = $controller->modificar_empleado($id,$cedula,$name,$lastname,$status);
        if($data){
            $response = [
                "data" => [$data],
                "error" => [],
            ];
            echo json_encode($response);
        }else{
            $response = [
                "data" => [],
                "error" => ["Ha ocurrido un error"],
            ];
            echo json_encode($response);
        }

        //Verificamos que el empleado exista en base de datos
        // $empleado = $controller->buscar_empleado($cedula);

        // if(count($empleado) > 0){
           
        // }else{
        //     $response = [
        //         "data" => [],
        //         "error" => ["Empleado no se encuenta registrado"],
        //     ];
        //     echo json_encode($response);
        // }
    }

    if(isset($_GET['extraer_empleados'])){
        $empleados = new EmpleadosController();
        $data = $empleados->extraer_data_empleados();
        echo json_encode($data);
    }

    if(isset($_GET['extraer_accounts'])){
        $empleados = new EmpleadosController();
        $data = $empleados->extraer_data_accounts();
        echo json_encode($data);
    }

    if(isset($_GET['extraer_roles'])){
        $empleados = new EmpleadosController();
        $data = $empleados->extraer_datos_roles();
        echo json_encode($data);
    }


