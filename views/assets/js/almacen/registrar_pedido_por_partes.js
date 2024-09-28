import app from '../api.js';
import utilidades from "../utilidades.js";
const d = document,
$fragment = d.createDocumentFragment(),
$empleado = d.querySelector("#empleado"),
$ruta = d.querySelector("#ruta"),
$partes = d.querySelector("#partes"),
$body_table = d.querySelector("#body_table"),
$registrar_pedido = d.querySelector("#registrar_pedido");

let numero_partes_pedido = 0;
let despachadores = [];

const { asignar_valores_select } = utilidades();

const mostrar_empleados = (data_empleados) => {
    //Mostramos los datos de los empleados

    const format_data = data_empleados.map( e => {
       const data = {
        id: e.id,
        nombre: `${e.nombre} ${e.apellido} - ${e.cedula}`
       }

       return {...data}
    })

    asignar_valores_select(
        { 
            data: format_data,
            titulo: "Seleccionar Empleado",
            input: $empleado,
            nombre_opciones : {
                id : "id",
                nombre: "nombre"  
            }
        }
    );
};

const mostrar_rutas = (data_rutas) => {
    //Mostramos los datos de las rutas
    asignar_valores_select(
        { 
            data: data_rutas,
            titulo: "Seleccionar Ruta",
            input: $ruta,
            nombre_opciones : {
                id : "id",
                nombre: "name"  
            }
        }
    );
};

const extraer_data_empleados = async () => {
    try {
        const data_empleados = await app('./controllers/empleados.php?extraer_empleados=1');
        console.log(data_empleados);
        mostrar_empleados(data_empleados)
    } catch (error) {
        console.log(error)
    }
};

const extraer_data_rutas = async () => {
    try {
        const data_rutas = await app('./controllers/almacen/rutas.php?extraer_rutas=1');
        mostrar_rutas(data_rutas)
    } catch (error) {
        console.log(error)
    }
};

const mostrar_datos_tabla = (datos) => {

  //Enlazamos el template creado en el HTML
  const $template_body_table_pedidos = d.querySelector('#template_body_table_pedidos').content;

  if(datos.length > 0){

    datos.forEach((element,i) => {
      //Insertamos los datos en el template
      $template_body_table_pedidos.querySelector('.part').textContent = `${i+1}` ;
      $template_body_table_pedidos.querySelector('.despachador').textContent = `${element.nombre}`;
      $template_body_table_pedidos.querySelector('.delete').dataset.id = element.id_despachador;
      
        //guardamos una copia de la estrutura actual del template en la variable $node
      let $clone = $template_body_table_pedidos.cloneNode(true);
      //Guardamos el nodo en el fragment
      $fragment.append($clone);
    });
    // //Limpiamos la lista
    $body_table.innerHTML = "";
    //Insertamos el fragment en la lista
    $body_table.append($fragment);
  }else{
    $body_table.innerHTML = "";
  }
}

const registrar_pedido = async (form_data) => {
  try {
    
  } catch (error) {
    
  }
}

const eliminar_despachador_tabla = (id_despachador) => {
  let index = null;
  
  for (let i = 0; i < despachadores.length; i++) {
    if(despachadores.id_despachador === id_despachador){
      index = i;
      break;
    }
  }

  despachadores.splice(index,1);
  mostrar_datos_tabla(despachadores);
}

$partes.addEventListener('change',  e=> {
  if($partes.value > 0){
    numero_partes_pedido = Number($partes.value);
    if(numero_partes_pedido < despachadores.length){
      despachadores.pop();
      mostrar_datos_tabla(despachadores);
    }
  }
})

$empleado.addEventListener('change', e => {
  if(numero_partes_pedido > 0){
    if($empleado.value !== ""){
      if(despachadores.length < numero_partes_pedido){
        const object = {
            id_despachador : $empleado.value,
            nombre: $empleado.options[$empleado.selectedIndex].text
        }
    
        despachadores.push(object);
        mostrar_datos_tabla(despachadores)
      }
    }
  }else{
    alert('Primero debe indicar el numero de partes')
    $empleado.selectedIndex = 0;
  }
})

$registrar_pedido.addEventListener('click', e => {

  const cod_pedido = d.querySelector('#cod_pedido');
  const ruta = d.querySelector('#ruta');
  const cant_unidades = d.querySelector('#cant_unidades');

  if(numero_partes_pedido < 1 ){
    alert('Debe ingresar el número de partes del pedido');
    $partes.focus();
    return;
  }

  if(cod_pedido.value === ""){
    alert('Debe indicar el número del pedido');
    cod_pedido.focus();
    return;
  }

  if(ruta.value === ""){
    alert('Debe seleccionar la ruta del pedido');
    ruta.focus();
    return;
  }

  if(cant_unidades.value === ""){
    alert('Debe indicar la cantidad de unidades del pedido');
    cant_unidades.focus();
    return;
  }

  if(despachadores.length < numero_partes_pedido){
    alert('Debe seleccionar Todos los despachadores del pedido');
    $empleado.focus();
    return;
  }

  const formData = new FormData();
  formData.append('cod_pedido', cod_pedido.value);
  formData.append('ruta', ruta.value);
  formData.append('cant_unidades', cant_unidades.value);
  formData.append('despachadores', despachadores);

})

d.addEventListener('click', e => {
    
  //Eliminamos despachador de la lista
  if(e.target.classList.contains('delete')){
      eliminar_despachador_tabla(despachadores,e.target.dataset.id);
  }
});

d.addEventListener('DOMContentLoaded', e => {
  extraer_data_empleados();
  extraer_data_rutas();
});