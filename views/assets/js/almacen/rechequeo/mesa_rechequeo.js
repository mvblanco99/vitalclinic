import app from '../../api.js';
const d = document,
$fragment = d.createDocumentFragment(),
$turno_manana = d.querySelector('#t_d'),
$turno_tarde = d.querySelector('#t_t'),
$body_table_mesa = d.querySelector('#body_table_mesa');

let mesas_turno_manana = [];
let mesas_turno_tarde = [];

const turnos = {
  "manana": 1,
  "tarde": 2
};

let turno_seleccionado = undefined;

const mostrar_data = () => {
  //Enlazamos el template creado en el HTML
  const $template_body_table_mesa = d.querySelector('#template_body_table_mesa').content;

  const data = turno_seleccionado == 1 ? [...mesas_turno_manana] : [...mesas_turno_tarde];

  if(data.length > 0){
      
      data.forEach((element,i) => {
          //Insertamos los datos en el template
          $template_body_table_mesa.querySelector('.n_mesa').textContent = element.numero_mesa;
          const nombre_rechequeador = element.nombre_rechequeador !== null ? `${element.nombre_rechequeador} ${element.apellido_rechequeador} - ${element.cedula_rechequeador}` : '';
          $template_body_table_mesa.querySelector('.rechequeador').textContent = nombre_rechequeador;
          const nombre_embalador = element.nombre_embalador !== null ? `${element.nombre_embalador} ${element.apellido_embalador} - ${element.cedula_embalador}` : '';
          $template_body_table_mesa.querySelector('.embalador').textContent = nombre_embalador;
          $template_body_table_mesa.querySelector('.edit').dataset.id = element.id_pareja_rechequeadores_embaladores;
          //guardamos una copia de la $template_body_table_pedidosestrutura actual del template en la variable $node
          let $clone = $template_body_table_mesa.cloneNode(true);
          //Guardamos el nodo en el fragment
          $fragment.append($clone);
      });

      // //Limpiamos la lista
      $body_table_mesa.innerHTML = "";
      //Insertamos el fragment en la lista
      $body_table_mesa.append($fragment);
  }else{  
      $body_table_mesa.innerHTML = "";
  }
}

const ordenar_data_mesas_rechequeo = (data) => {
  mesas_turno_manana = data.filter(e => e.turno == 1);
  mesas_turno_tarde = data.filter(e => e.turno == 2);
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

d.addEventListener('DOMContentLoaded', async e => {
  await extraer_data_mesa_rechequeo();
  
  turno_seleccionado = turnos["manana"];
  $turno_manana.classList.add('bg-gray-400');
  $turno_tarde.classList.contains('bg-gray-400') ? $turno_tarde.classList.remove('bg-gray-400') : '';

  mostrar_data();
})