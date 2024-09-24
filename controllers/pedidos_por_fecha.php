<?php

include '../models/pedidos_por_fecha.php';

class PedidosPorFechaController {

    public function obtener_rutas(){
        $model = new PedidosPorFechaModel();
        $data = $model->obtener_rutas();
        return $data;
    }

    public function obtener_pedidos($start_date='', $final_date='', $ruta=''){
        $model = new PedidosPorFechaModel();
        $data = $model->obtener_pedidos($start_date, $final_date, $ruta);
        return $data;
    }
}

if(isset($_GET['obtener_rutas'])){

    $controller = new PedidosPorfechaController();
    $rutas = $controller->obtener_rutas();
    echo json_encode(["rutas" => $rutas]);
}

if(isset($_GET['obtener_pedidos'])){

    $start_date = $_POST['start_date'];
    $final_date = $_POST['final_date'];
    $ruta = $_POST['ruta'];

    $controller = new PedidosPorfechaController();
    $rutas = $controller->obtener_pedidos($start_date, $final_date, $ruta);
    echo json_encode(["rutas" => $rutas]);
}

