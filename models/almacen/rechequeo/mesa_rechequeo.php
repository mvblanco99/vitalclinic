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

  public function consultar_rechequeadores(){
    $sql = "SELECT 
    accounts.id_account as id_cuenta,
    rechequeador.nombre as nombre_rechequeador,
    rechequeador.apellido as apellido_rechequeador,
    rechequeador.cedula as cedula_rechequeador
    FROM accounts
    INNER JOIN empleados as rechequeador on accounts.id_empleado=rechequeador.id
    WHERE accounts.status = 1 and accounts.role_id= 4";
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

  public function consultar_embaladores(){
    $sql = "SELECT 
    id as id_embalador,
    cedula as cedula_embalador,
    nombre as nombre_embalador,
    apellido as apellido_embalador
    FROM empleados
    WHERE status = 1
    ";
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

  public function registrar_pareja_rechequeadora($id_mesa = "", $id_rechequeador="", $id_embalador=""){
        
    try {
      // Primera operación: INSERT en la tabla pedidos
      $sql_tabla_pedidos = "UPDATE pareja_rechequeadores_embaladores SET
      id_rechequeador = ?,
      id_embalador = ?
      WHERE id = ?";

      // Preparar la consulta
      $stmt = $this->conn->prepare($sql_tabla_pedidos);

  
      // Verificar si la preparación falló
      if ($stmt === false) {
          throw new Exception("Error al preparar la consulta: " . $this->conn->error);
      }

      // Vincular parámetros
      $stmt->bind_param("sss", $id_rechequeador,$id_embalador,$id_mesa);

      // Ejecutar la consulta
      if (!$stmt->execute()) {
          throw new Exception("Error al registrar pareja rechequeadora: " . $stmt->error);
      }
      return true;
    } catch (Exception $e) {
        // Revertir la transacción en caso de error
        echo "Transacción fallida: " . $e->getMessage();
        return false;
    }
  }   
}
