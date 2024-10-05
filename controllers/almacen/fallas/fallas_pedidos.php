<?php
    include "../../models/almacen/fallas_pedidos.php";

    class FallasController{

        public function extraer_motivos_fallas(){
            $motivos = new FallasModel();
            $data = $motivos->extraer_motivos_fallas();
            return $data;
        }

        public function registrar_fallas($num_pedido="",$motivo="",$descripcion=""){
            $motivos = new FallasModel();
            $data = $motivos->registrar_fallas($num_pedido,$motivo,$descripcion);
            return $data;
        }
    }

    if(isset($_GET['extraer_motivos'])){
        $controller = new FallasController();
        $data = $controller->extraer_motivos_fallas();
        echo json_encode($data);
    }


    if(isset($_GET['registrar_fallas'])){

        $num_pedido = $_POST['num_pedido'];
        $motivo = $_POST['motivo'];
        $descripcion = $_POST['descripcion'];

        $controller = new FallasController();
        $data = $controller->registrar_fallas($num_pedido,$motivo,$descripcion);
        echo json_encode($data);
    }

    