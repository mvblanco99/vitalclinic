import app from '../../api.js';
import utilidades from "../../utilidades.js";
const d = document,
$fragment = d.createDocumentFragment(),
$turno_manana = d.querySelector('#t_d'),
$turno_tarde = d.querySelector('#t_t'),
$body_table_mesa = d.querySelector('#body_table_mesa');

const { asignar_valores_select } = utilidades();

let mesas_turno_manana = [];
let mesas_turno_tarde = [];
let id_mesa;
let data_rechequeadores = [];
let data_embaladores = [];

const turnos = {
  "manana": 1,
  "tarde": 2
};

let turno_seleccionado = undefined;

const limpiar_tabla = (inputs) => {
  inputs.forEach((element,i) => {
    inputs[i].querySelector('.rechequeador').innerHTML = '';    
    inputs[i].querySelector('.embalador').innerHTML = '';
  })
}

const mostrar_data = () => {
  //Enlazamos el template creado en el HTML
  const $tr = Array.from($body_table_mesa.querySelectorAll('tr'));
  const data = turno_seleccionado == 1 ? [...mesas_turno_manana] : [...mesas_turno_tarde];

  limpiar_tabla($tr);

  if(data.length > 0){
      
      data.forEach((element,i) => {
          //Insertamos los datos en el template
          $tr[i].querySelector('.n_mesa').innerHTML = element.numero_mesa;
          const nombre_rechequeador = element.nombre_rechequeador !== null ? `${element.nombre_rechequeador} ${element.apellido_rechequeador} - ${element.cedula_rechequeador}` : '';
          $tr[i].querySelector('.rechequeador').innerHTML = nombre_rechequeador;
          const nombre_embalador = element.nombre_embalador !== null ? `${element.nombre_embalador} ${element.apellido_embalador} - ${element.cedula_embalador}` : '';
          $tr[i].querySelector('.embalador').innerHTML = nombre_embalador;
          $tr[i].querySelector('.edit').dataset.id = element.id_pareja_rechequeadores_embaladores;
          //guardamos una copia de la $template_body_table_pedidosestrutura actual del template en la variable $node
          // let $clone = $template_body_table_mesa.cloneNode(true);
          //Guardamos el nodo en el fragment
          // $fragment.append($clone);
      });

      // //Limpiamos la lista
      // $body_table_mesa.innerHTML = "";
      //Insertamos el fragment en la lista
      // $body_table_mesa.append($fragment);
  }else{  
      limpiar_tabla($tr);
  }
}

const mostrar_rechequeadores = (data_rechequeadores) => {
  //Mostramos los datos de los empleados

  const format_data = data_rechequeadores.map( e => {
     const data = {
      id: e.id_cuenta,
      nombre: `${e.nombre_rechequeador} ${e.apellido_rechequeador} - ${e.cedula_rechequeador}`
     }

     return {...data}
  })

  const $requeador = d.querySelector('#rechequeador');

  asignar_valores_select(
      { 
          data: format_data,
          titulo: "Seleccionar Rechequeador",
          input: $requeador,
          nombre_opciones : {
              id : "id",
              nombre: "nombre"  
          }
      }
  );
};

const mostrar_embaladores = (data_embaladores) => {
  //Mostramos los datos de los empleados

  const format_data = data_embaladores.map( e => {
     const data = {
      id: e.id_embalador,
      nombre: `${e.nombre_embalador} ${e.apellido_embalador} - ${e.cedula_embalador}`
     }

     return {...data}
  })

  const $embalador = d.querySelector('#embalador');

  asignar_valores_select(
      { 
          data: format_data,
          titulo: "Seleccionar Embalador",
          input: $embalador,
          nombre_opciones : {
              id : "id",
              nombre: "nombre"  
          }
      }
  );
};

const ordenar_data_mesas_rechequeo = (data) => {
  mesas_turno_manana = data.filter(e => e.turno == 1);
  mesas_turno_tarde = data.filter(e => e.turno == 2);
}

const consultar_data_rechequeadores_embaladores = async () => {
  try {
    const res = await app('./controllers/almacen/rechequeo/mesa_rechequeo.php?consultar_data_rechequeadores_embaladores=1');
    if(res.data.length > 0){
       data_embaladores = res.data[0].data_embaladores;
       data_rechequeadores = res.data[0].data_rechequeadores;

       console.log(data_embaladores)
      }else{
          alert(`${res.error}`)
          return;
      }
  } catch (error) {
    console.log(error)
  }
}

const extraer_data_mesa_rechequeo = async () => {
  try {
    const res = await app('./controllers/almacen/rechequeo/mesa_rechequeo.php?consultar_parejas_rechequeadoras=1');
    if(res.data.length > 0){
       ordenar_data_mesas_rechequeo(res.data[0])
      }else{
          alert(`${res.error}`)
          return;
      }
  } catch (error) {
    console.log(error)
  }
}

const registrar_pareja_rechequeadora = async (form_data) => {
  try {
    const res = await app('./controllers/almacen/rechequeo/mesa_rechequeo.php?registrar_pareja_rechequeadora=1','POST',form_data);
    if(res.data.length > 0){
        await extraer_data_mesa_rechequeo();
        alert('Modificación exitosa');
        mostrar_data();
      }else{
          alert(`${res.error}`)
          return;
      }
  } catch (error) {
    console.log(error)
  }
}

$turno_manana.addEventListener('click', e=> {
  turno_seleccionado = turnos["manana"];
  $turno_manana.classList.add('bg-gray-400');
  $turno_tarde.classList.contains('bg-gray-400') ? $turno_tarde.classList.remove('bg-gray-400') : '';
  mostrar_data();
})

$turno_tarde.addEventListener('click', e=> {
  turno_seleccionado = turnos["tarde"];
  $turno_tarde.classList.add('bg-gray-400');
  $turno_manana.classList.contains('bg-gray-400') ? $turno_manana.classList.remove('bg-gray-400') : '';
  mostrar_data();
})

d.addEventListener('submit', e=> {
  e.preventDefault();

  const rechequeador = e.target.rechequeador.value;
  const embalador = e.target.embalador.value;

  if(rechequeador === ""){
    alert('Debe seleccionar un rechequeador');
    e.target.rechequeador.focus();
    return;
  }

  if(embalador === ""){
    alert('Debe seleccionar un embalador');
    e.target.embalador.focus();
    return;
  }

  const form_data = new FormData();
  form_data.append('id_mesa', id_mesa);
  form_data.append('id_rechequeador', rechequeador);
  form_data.append('id_embalador', embalador);

  registrar_pareja_rechequeadora(form_data);

})

d.addEventListener('click', async e => {
  if(e.target.classList.contains('edit')){
    await consultar_data_rechequeadores_embaladores();
    mostrar_rechequeadores(data_rechequeadores);
    mostrar_embaladores(data_embaladores);
    id_mesa = e.target.dataset.id;
  }
})

d.addEventListener('DOMContentLoaded', async e => {
  await extraer_data_mesa_rechequeo();
  
  turno_seleccionado = turnos["manana"];
  $turno_manana.classList.add('bg-gray-400');
  $turno_tarde.classList.contains('bg-gray-400') ? $turno_tarde.classList.remove('bg-gray-400') : '';

  mostrar_data();
})