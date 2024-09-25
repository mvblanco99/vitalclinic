<?php

include "../../models/almacen/rechequear.php";

class RechequearPedidoController{

    public function rechequear($embalador="",$num_pedido=""){
        $model = new RechequearPedidoModel();
        $data = $model->rechequear_pedido($embalador,$num_pedido);
        return $data;
    }

    public function extraer_embalador_asignado(){
        $model = new RechequearPedidoModel();
        $data = $model->extraer_embalador_asignado();
        return $data;
    }   
}


if(isset($_GET['rechequear'])){
    $embalador = $_POST['embalador'];
    $num_pedido = $_POST['num_pedido'];

    $controller = new RechequearPedidoController();
    $data = $controller->rechequear($embalador,$num_pedido);
    echo json_encode($data);
}


if(isset($_GET['extraer_embalador_asignado'])){
    
    $controller = new RechequearPedidoController();
    $data = $controller->extraer_embalador_asignado();
    echo json_encode($data);
}