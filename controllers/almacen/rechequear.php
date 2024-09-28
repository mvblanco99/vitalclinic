<?php

include "../../models/almacen/rechequear.php";

class RechequearPedidoController{

    public function rechequear($embalador="",$parts=[]){
        $model = new RechequearPedidoModel();
        $data = $model->rechequear_pedido($embalador,$parts);
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
    $parts = $_POST['parts'];

    $controller = new RechequearPedidoController();
    $data = $controller->rechequear($embalador,$parts);
    echo json_encode($data);
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