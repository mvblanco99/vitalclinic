<?php 

    class ModeloLinks {

       private $lista_links_permitidos = [
            "inicio" => "inicio",
            "login" => "auth/index" ,
            "registrar_empleado" => "registro/registrar_empleado",
            "registrar_cuenta" => "registro/registrar_cuenta",
            "registrar_producto" => "inventario/registrar_producto"
        ];

        public function checkLinkExistence($name_link){
            $exist_link = array_key_exists($name_link, $this->lista_links_permitidos) 
                ? $this->lista_links_permitidos[$name_link] 
                : "" ;
            return $exist_link;      
         }

        public function gestionar_redireccion($link = ""){
            $link_lower_case = strtolower($link);
            //Verificamos que el link exista
            $direccion = $this->checkLinkExistence($link_lower_case);
            //Verificamos si tiene session activa
            
            if($direccion == ""){
                $direccion = "inicio";
            }
            //redireccionamos
            $module = "views/modules/".$direccion.".php";
            return $module;
        }
    }