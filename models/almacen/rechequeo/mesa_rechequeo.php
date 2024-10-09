<?php

require_once '../../../connection/connection.php';

class MesaRechequeoModel extends Connection{

  private $conn;

  public function __construct(){
      $this->conn = $this->connect();
  }

  public function consultar_parejas_rechequeadoras($turno=""){
    $sql = "SELECT 
    mesas_rechequeadoras.num_mesa as numero_mesa,
    pareja_rechequeadores_embaladores.turno as turno,
    pareja_rechequeadores_embaladores.id as id_pareja_rechequeadores_embaladores,
    rechequeador.nombre as nombre_rechequeador,
    rechequeador.apellido as apellido_rechequeador,
    rechequeador.cedula as cedula_rechequeador,
    embalador.nombre as nombre_embalador,
    embalador.apellido as apellido_embalador,
    embalador.cedula as cedula_embalador
    FROM mesas_rechequeadoras
    LEFT JOIN pareja_rechequeadores_embaladores on mesas_rechequeadoras.id=pareja_rechequeadores_embaladores.id_mesa
    LEFT JOIN empleados as embalador on pareja_rechequeadores_embaladores.id_embalador=embalador.id
    LEFT JOIN accounts on pareja_rechequeadores_embaladores.id_rechequeador=accounts.id_account
    LEFT JOIN empleados as rechequeador on accounts.id_empleado=rechequeador.id ORDER BY numero_mesa;";
    $result = $this->conn->query($sql);

    // Devolver los resultados como un array JSON
    $dataBusqueda = array();
    if ($result->num_rows > 0) {
        // Output data of each row
        while($row = $result->fetch_assoc()) {
            $dataBusqueda[] = $row;
        }
    }

    // Cerrar conexión
    //$this->conn->close();
    return $dataBusqueda;
  }

}