<?php

include "../../../models/almacen/rechequeo/mesa_rechequeo.php";

class MesaRechequeoController{

    public function registrar_pareja_rechequeadora($id_mesa = "", $id_rechequeador="", $id_embalador=""){
        $model = new MesaRechequeoModel();
        $data = $model->registrar_pareja_rechequeadora($id_mesa, $id_rechequeador, $id_embalador);
        return [$data];
    }
    public function consultar_parejas_rechequeadoras(){
        $model = new MesaRechequeoModel();
        $data = $model->consultar_parejas_rechequeadoras();
        return $data;
    }

    public function consultar_data_rechequeadores_embaladores(){
        $model = new MesaRechequeoModel();
        $data_rechequeadores = $model->consultar_rechequeadores();
        $data_embaladores = $model->consultar_embaladores();
        return ['data_rechequeadores' => $data_rechequeadores, 'data_embaladores' => $data_embaladores];
    }
}

if(isset($_GET['consultar_data_rechequeadores_embaladores'])){
    $controller = new MesaRechequeoController();
    $data = $controller->consultar_data_rechequeadores_embaladores();
    
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

if(isset($_GET['registrar_pareja_rechequeadora'])){

    $id_mesa = $_POST['id_mesa']; 
    $id_rechequeador=$_POST['id_rechequeador'];
    $id_embalador=$_POST['id_embalador'];
  
    $controller = new MesaRechequeoController();
    $data = $controller->registrar_pareja_rechequeadora($id_mesa,$id_rechequeador,$id_embalador);
    
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