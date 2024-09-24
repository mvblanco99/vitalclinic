<?php

    include "../models/auth_model.php";
    include "./control_de_sessiones.php";

class Auth{

    public function login($username="",$password=""){
        //Validar Data
        //DETENGO EL PROCESO E INFORMO QUE NO SE CUMPLIERON LAS VALIDACIONES
        
        //SI CUMPLE CON LAS VALIDACIONES
        $model = new AuthModel();
        $data = $model->login($username,$password);

        if(count($data) > 0){
            $crear_session = new ControlSesiones();
            $session = $crear_session->generar_sesion($data[0]['username'],$data[0]['nombre'],$data[0]['apellido'],$data[0]['role_id'],$data[0]['id_account']);
            return [ $session ];
        }else{
            // En caso contrario indicamos que las credenciales estan erroneas
            return [];
        }
    }
}

if(isset($_GET['auth'])){
    $username = $_POST['username'];
    $password = $_POST['password'];

    $auth = new Auth();
    $acceso = $auth->login($username,$password);
    echo json_encode($acceso);
}

