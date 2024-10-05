import app from '../../api.js';
const d = document,
$fragment = d.createDocumentFragment(),
$body_table_pedidos = d.querySelector("#body_table_pedidos"),
$body_table_pedidos_d_r_e = d.querySelector("#body_table_pedidos_d_r_e");

const mostrar_datos_tabla_pedidos = async(data) => {

  //Enlazamos el template creado en el HTML
  const $template_body_table_pedidos = d.querySelector('#template_body_table_pedidos').content;

  if(data.length > 0){
      
      data.forEach(element => {
          //Insertamos los datos en el template
          $template_body_table_pedidos.querySelector('.n_pedido').textContent = ;
          $template_body_table_pedidos.querySelector('.ruta').textContent = ;
          $template_body_table_pedidos.querySelector('.c_unidades').textContent = ;
          $template_body_table_pedidos.querySelector('.fecha_entrega').textContent = ;
          $template_body_table_pedidos.querySelector('.entregador_por').textContent = ;
          //guardamos una copia de la estrutura actual del template en la variable $node
          let $clone = $template_body_table_pedidos.cloneNode(true);
          //Guardamos el nodo en el fragment
          $fragment.append($clone);
      });

      // //Limpiamos la lista
      $body_table_pedidos.innerHTML = "";
      //Insertamos el fragment en la lista
      $body_table_pedidos.append($fragment);
  }else{  
      $body_table_pedidos.innerHTML = "";
  }
}

const mostrar_datos_tabla_pedidos_d_r_e = async(data) => {

  //Enlazamos el template creado en el HTML
  const $template_body_table_pedidos_d_r_e = d.querySelector('#template_body_table_pedidos_d_r_e').content;

  if(data.length > 0){
      
      data.forEach(element => {
          //Insertamos los datos en el template
          $template_body_table_pedidos_d_r_e.querySelector('part').textContent = ;
          $template_body_table_pedidos_d_r_e.querySelector('.despachador').textContent = ;
          $template_body_table_pedidos_d_r_e.querySelector('.rechequeador').textContent = ;
          $template_body_table_pedidos_d_r_e.querySelector('.embalador').textContent = ;
          $template_body_table_pedidos_d_r_e.querySelector('.fecha_rechequeado').textContent = ;
          $template_body_table_pedidos_d_r_e.querySelector('.fallas').textContent = ;
          //guardamos una copia de la $template_body_table_pedidosestrutura actual del template en la variable $node
          let $clone = $template_body_table_pedidos_d_r_e.cloneNode(true);
          //Guardamos el nodo en el fragment
          $fragment.append($clone);
      });

      // //Limpiamos la lista
      $body_table_pedidos_d_r_e.innerHTML = "";
      //Insertamos el fragment en la lista
      $body_table_pedidos_d_r_e.append($fragment);
  }else{  
      $body_table_pedidos_d_r_e.innerHTML = "";
  }
}

const extraer_datos_pedido = async(form_data) => {
  try {
      const data_pedido = await app('./controllers/almacen/pedidos/pedidos.php?extraer_data_pedido=1','POST',form_data);
      if(data_pedido.data.length > 0){
          console.log(data_pedido)
      }else{
          alert('El número de pedido no se encuentra registrado')
      }
  } catch (error) {
      console.log(error)
  }
}