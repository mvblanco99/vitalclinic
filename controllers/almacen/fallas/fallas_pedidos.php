<?php
    include "../../../models/almacen/fallas/fallas_pedidos.php";

    class FallasController{

        public function extraer_motivos_fallas(){
            $motivos = new FallasModel();
            $data = $motivos->extraer_motivos_fallas();
            return $data;
        }

        public function registrar_fallas($id_despachador = "",$motivo = "",$descripcion = "", $id_pedido_d_r_e = ""){
            $motivos = new FallasModel();
            $data = $motivos->registrar_fallas($id_despachador,$motivo,$descripcion,$id_pedido_d_r_e);
            return $data;
        }
    }

    if(isset($_GET['extraer_motivos'])){
        $controller = new FallasController();
        $data = $controller->extraer_motivos_fallas();
        echo json_encode($data);
    }


    if(isset($_GET['registrar_fallas'])){

        $id_despachador = $_POST['id_despachador'];
        $motivo = $_POST['motivo'];
        $descripcion = $_POST['descripcion'];
        $id_pedido_d_r_e = $_POST['id_pedido_d_r_e'];

        $controller = new FallasController();
        $data = $controller->registrar_fallas($id_despachador,$motivo,$descripcion,$id_pedido_d_r_e);
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

    