import app from '../../api.js';
import utilidades from "../../utilidades.js";
const d = document,
$fragment = d.createDocumentFragment(),
$empleado = d.querySelector("#empleado"),
$ruta = d.querySelector("#ruta"),
$partes = d.querySelector("#partes"),
$body_table = d.querySelector("#body_table"),
$modificar_pedido = d.querySelector("#modificar_pedido");

let buscado = false;
let data_partes_pedido = [];
let data_empleados = null;

const { asignar_valores_select } = utilidades();

const mostrar_empleados = (data_empleados, input) => {
    //Mostramos los datos de los empleados

    const format_data = data_empleados.map( e => {
       const data = {
        id: e.id,
        nombre: `${e.nombre} ${e.apellido}`
       }

       return {...data}
    })

    asignar_valores_select(
        { 
            data: format_data,
            titulo: "Seleccionar Empleado",
            input: input,
            nombre_opciones : {
                id : "id",
                nombre: "nombre"  
            }
        }
    );
};

const extraer_data_empleados = async () => {
    try {
        data_empleados = await app('./controllers/users/empleados.php?extraer_empleados=1');
    } catch (error) {
        console.log(error)
    }
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

const extraer_data_rutas = async () => {
    try {
        const data_rutas = await app('./controllers/almacen/rutas.php?extraer_rutas=1');
        mostrar_rutas(data_rutas)
    } catch (error) {
        console.log(error)
    }
};

const mostrar_datos_tabla= async(data) => {

    //Enlazamos el template creado en el HTML
    const $template_body_table_pedidos = d.querySelector('#template_body_table_pedidos').content;

    if(data.length > 0){
        
        data.forEach((element,i) => {
            //Insertamos los datos en el template
            $template_body_table_pedidos.querySelector('.part').textContent = `${i+1}`;
            $template_body_table_pedidos.querySelector('.select').classList.add(`select-${i+1}`);
            $template_body_table_pedidos.querySelector('.select').dataset.id = i+1;
            mostrar_empleados(data_empleados,$template_body_table_pedidos.querySelector(`.select-${i+1}`));
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

    data.forEach((element,i) => {
        if(element.id_despachador == 1){
            d.querySelector(`.select-${i+1}`).selectedIndex = Number(element.id_despachador)
        }else{
            d.querySelector(`.select-${i+1}`).selectedIndex = Number(element.id_despachador) - 1
        }
        
    });
}

const mostrar_data_form = (data) => {
    
    d.querySelector("#cant_unidades").value = data.cantidad_unidades;
    d.querySelector("#ruta").selectedIndex = data.id_ruta;
}

const extraer_datos_pedido = async(form_data) => {
    try {
        const data_pedido = await app('./controllers/almacen/pedidos/pedidos.php?extraer_data_pedido=1','POST',form_data);
        if(data_pedido.data.length > 0){
            console.log(data_pedido)
            mostrar_datos_tabla(format_data(data_pedido.data[0].partes_pedido));
            mostrar_data_form(data_pedido.data[0]);
            d.querySelector('#id_pedido').value = data_pedido.data[0].id_pedido;

            d.querySelector('#cod_pedido').disabled = true;
            $partes.disabled = true;

            buscado = true;
        }else{
            alert('El número de pedido no se encuentra registrado')
        }
    } catch (error) {
        console.log(error)
    }
}

const format_data = (data) => {

    //Agregamos la informacion de los despachadores al array despachadores
    data.forEach(e => {
        const object = {
            id_despachador : e.id_despachador,
            nombre: `${e.nombre} ${e.apellido}`,
            id_pedido_d_r_e: e.id_pedido_d_r_e
        }
        data_partes_pedido.push(object);
    });

    return data_partes_pedido;
}

const getDataForm = () => {
    const cod_pedido = d.querySelector('#cod_pedido');
    const ruta = d.querySelector('#ruta');
    const cant_unidades = d.querySelector('#cant_unidades');
    const id_pedido = d.querySelector('#id_pedido').value;
    const ids_despachadores = Array.from(d.querySelectorAll('.select')).map(e => e.value) ;
  
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

    const formData = new FormData();
    formData.append('id_pedido', id_pedido);
    formData.append('ruta', ruta.value);
    formData.append('cant_unidades', cant_unidades.value);
    data_partes_pedido.forEach(item => {
      formData.append('despachadores[]',item.id_despachador);
      formData.append('id_parte_pedidos[]',item.id_pedido_d_r_e);
    })
    
    modificar_pedido(formData)
}

const modificar_pedido = async (form_data) => {
    try {
        const res = await app('./controllers/almacen/pedidos/pedidos.php?modificar_pedido=1','POST',form_data);
        if(res.data.length > 0){
            alert('Modificación del pedido exitoso');
            limpiarformmulario();
          }else{
              alert(`${res.error}`)
          }
      } catch (error) {
        console.log(error)
    }
}

const limpiarformmulario = () => {
    $body_table.innerHTML = "";
    d.querySelector('#cod_pedido').value="";
    $ruta.selectedIndex = 0;
    d.querySelector('#cant_unidades').value = "";
    d.querySelector('#cod_pedido').disabled = false;
    buscado = false;
    let data_partes_pedido_copy = [...data_partes_pedido];
    data_partes_pedido_copy = [];
    data_partes_pedido = data_partes_pedido_copy;
}

d.addEventListener('change', e=> {
    if(e.target.classList.contains('select')){
        const dataset = e.target.dataset.id;
        //Obtenemos el item del array que queremos modificar
        const data_parte_pedido_copy = {...data_partes_pedido[(dataset-1)]};

        const nombre = e.target.options[e.target.selectedIndex].text;
        const id_despachador = e.target.value;
        
        //creamos el nuevo item
        const item = {
            id_despachador: id_despachador,
            nombre: nombre,
            id_pedido_d_r_e: data_parte_pedido_copy.id_pedido_d_r_e
        }

        const data_partes_pedido_copy = [...data_partes_pedido];
        data_partes_pedido_copy[dataset-1] = item;

        data_partes_pedido = [...data_partes_pedido_copy];       
    }
})

d.addEventListener('click', e => {
    
    if(e.target.classList.contains('modificar_pedido')){
      if(!buscado){
        alert('Debe buscar el número de pedido');
        d.querySelector('#cod_pedido').focus();
        return;
      }
      getDataForm();
    }
});

d.addEventListener('submit', e=> {
    e.preventDefault();

    const cod_pedido = e.target.cod_pedido.value;

    if(cod_pedido == ""){
        alert('Por favor ingresar el número de pedido');
        e.target.cod_pedido.focus();
        return; 
    }

    const formdata = new FormData();
    formdata.append('cod_pedido',cod_pedido);
    extraer_datos_pedido(formdata);
})

d.addEventListener('DOMContentLoaded', async e => {
   await extraer_data_empleados();
    extraer_data_rutas();
});