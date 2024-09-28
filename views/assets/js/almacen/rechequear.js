import app from '../api.js';
import utilidades from "../utilidades.js";
const { asignar_valores_select } = utilidades();
const d = document,
$empleado = d.querySelector("#empleado"),
$embalador_asignado = d.querySelector("#embalador_asignado"),
$embalador_seleccionado = d.querySelector("#embalador_seleccionado");

let embaladorAsignado;
let embaladorSeleccionado = undefined;

const extraer_embalador_asignado = async () => {
    try {
        const data = await app('./controllers/almacen/rechequear.php?extraer_embalador_asignado=1');
        embaladorAsignado = data[0];
        console.log(embaladorAsignado)
    } catch (error) {
        console.log(error)
    }
};

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
}

const extraer_data_empleados = async () => {
    try {
        const data_empleados = await app('./controllers/empleados.php?extraer_empleados=1');
        mostrar_empleados(data_empleados)
    } catch (error) {
        console.log(error)
    }
};

const rechequear_pedido = async(form_data) => {
    try {
        const data = await app('./controllers/almacen/rechequear.php?rechequear=1','POST',form_data);
        if(!data){
            alert('Ha proporcionado un codigo de pedido incorrecto')
        }
    } catch (error) {
        console.log(error)
    }
}

$embalador_asignado.addEventListener('click', e => {
    if(embaladorAsignado === undefined){
        alert('No tiene embalador asignado')
    }else{
        embaladorSeleccionado = embaladorAsignado;
        $embalador_seleccionado.value = `${embaladorSeleccionado.nombre} ${embaladorSeleccionado.apellido}`;
        $empleado.selectedIndex = 0;
    }
})

$empleado.addEventListener('change', e => {
    if($empleado.value !== ""){
        const object = {
            id_embalador : $empleado.value,
            nombre: $empleado.options[$empleado.selectedIndex].text
        }
        embaladorSeleccionado = object;
        $embalador_seleccionado.value = embaladorSeleccionado.nombre;
    }
})

d.addEventListener('DOMContentLoaded', e =>{
    extraer_data_empleados();
    extraer_embalador_asignado();
})

d.addEventListener('submit', e =>{
    e.preventDefault()

    const embalador = embaladorSeleccionado;
    const numero_pedido = e.target.cod_pedido.value;

    if(embalador === undefined){
        alert('Por favor seleccionar un embalador');
        return;
    }

    if(numero_pedido === ""){
        alert('Por favor ingresar el numero de pedido');
        return;
    }

    const form_data = new FormData();
    form_data.append('embalador', embalador.id_embalador);
    form_data.append('num_pedido', numero_pedido);

    rechequear_pedido(form_data);
})