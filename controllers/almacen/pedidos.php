<?php
    include "../../models/almacen/pedidos.php";

    class PedidosController{

        public function registrar_pedido($cod_pedido="",$empleado="",$ruta="",$cant_unidades=""){
            //VALIDAR DATA
            $model = new PedidosModel();
            $data = $model->registrar_pedido($cod_pedido, $empleado,$ruta,$cant_unidades);
            return $data;
        }

        // public function extraer_data_rutas(){
        //     $model = new RutasModel();
        //     $data = $model->extraer_data_rutas();
        //     return $data;
        // }
    }

    if(isset($_GET['registrar_pedido'])){
        $cod_pedido = $_POST['cod_pedido'];
        $ruta = $_POST['ruta'];
        $empleado = $_POST['empleado'];
        $cant_unidades = $_POST['cant_unidades'];
    
        $registro = new PedidosController();
        $data = $registro->registrar_pedido($cod_pedido, $empleado, $ruta, $cant_unidades);
        echo json_encode($data);
    }

    // if(isset($_GET['extraer_rutas'])){
    //     $registro = new RutasController();
    //     $data = $registro->extraer_data_rutas();
    //     echo json_encode($data);
    // }