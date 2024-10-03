<?php

include "../../../models/almacen/rechequeo/rechequear.php";

class RechequearPedidoController{

    public function rechequear($embalador="",$id_pedido_d_r_e=[]){
        $model = new RechequearPedidoModel();
        $data = $model->rechequear_pedido($embalador,$id_pedido_d_r_e);
        return $data;
    }

    public function extraer_embalador_asignado(){
        $model = new RechequearPedidoModel();
        $data = $model->extraer_embalador_asignado();
        return $data;
    }
    
    public function extraer_partes_pedido($num_pedido=""){
        $model = new RechequearPedidoModel();
        $data = $model->extraer_partes_pedido($num_pedido);
        return $data;
    }
}


if(isset($_GET['rechequear'])){
    $embalador = $_POST['embalador'];
    $id_pedido_d_r_e = $_POST['id_pedido_d_r_e'];

    $controller = new RechequearPedidoController();
    $data = $controller->rechequear($embalador,$id_pedido_d_r_e);
    
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
    
}

if(isset($_GET['extraer_embalador_asignado'])){
    
    $controller = new RechequearPedidoController();
    $data = $controller->extraer_embalador_asignado();
    echo json_encode($data);
}

if(isset($_GET['extraer_partes_pedido'])){

    $cod_pedido = $_POST['num_pedido'];
    
    $controller = new RechequearPedidoController();
    $data = $controller->extraer_partes_pedido($cod_pedido);
    echo json_encode($data);
}