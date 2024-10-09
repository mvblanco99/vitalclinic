<?php

include "../../../models/almacen/rechequeo/mesa_rechequeo.php";

class MesaRechequeoController{

    // public function rechequear($embalador="",$id_pedido_d_r_e=[]){
    //     $model = new MesaRechequeoModel();
    //     $data = $model->rechequear_pedido($embalador,$id_pedido_d_r_e);
    //     return $data;
    // }

    public function consultar_parejas_rechequeadoras(){
        $model = new MesaRechequeoModel();
        $data = $model->consultar_parejas_rechequeadoras();
        return $data;
    }
}

if(isset($_GET['consultar_parejas_rechequeadoras'])){
  
  $controller = new MesaRechequeoController();
  $data = $controller->consultar_parejas_rechequeadoras();
  
  if(count($data)>0){
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