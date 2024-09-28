<?php
    include "../../models/almacen/pedidos.php";

    class PedidosController{
        public function registrar_pedido($cod_pedido="",$despachadores=[],$ruta="",$cant_unidades=""){
            //VALIDAR DATA
            $model = new PedidosModel();
            $data = $model->registrar_pedido($cod_pedido, $despachadores,$ruta,$cant_unidades);
            return $data;
        }    
    }

    if(isset($_GET['registrar_pedido'])){
        $cod_pedido = $_POST['cod_pedido'];
        $ruta = $_POST['ruta'];
        $despachadores = $_POST['despachadores'];
        $cant_unidades = $_POST['cant_unidades'];
    
        $registro = new PedidosController();
        $data = $registro->registrar_pedido($cod_pedido, $despachadores, $ruta, $cant_unidades);
        echo json_encode($data);
    }

