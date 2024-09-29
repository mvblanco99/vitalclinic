import app from '../api.js';
import utilidades from "../utilidades.js";
const d = document,
$empleado = d.querySelector("#empleado");

let data_empleados = [];

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

const extraer_data_empleados = async () => {
    try {
        data_empleados = await app('./controllers/users/empleados.php?extraer_empleados=1');
        mostrar_empleados(data_empleados)
    } catch (error) {
        console.log(error)
    }
};

const modificar_empleado = async(form_data) => {
    try {
      const res = await app('./controllers/users/empleados.php?modificar_empleado=1','POST', form_data);
        if(res.data.length > 0){
            alert('Modificación exitosa');
            limpiarformmulario();
            extraer_data_empleados();
        }else{
            alert(`${res.error}`)
        }

    } catch (error) {
      console.log(error)
    }
}

const limpiarformmulario = () => {
    d.querySelector('#cedula').value = "";
    d.querySelector('#name').value = "";
    d.querySelector('#lastname').value = "";
    d.querySelector("#status").selectedIndex = 0
}

$empleado.addEventListener('change', e => {
    if($empleado.value !== ""){
        const id_empleado = $empleado.value;
        const data_empleado = data_empleados.filter(i => i.id === id_empleado);

        d.querySelector('#cedula').value = data_empleado[0].cedula;
        d.querySelector('#name').value = data_empleado[0].nombre;
        d.querySelector('#lastname').value = data_empleado[0].apellido;
        d.querySelector('#id').value = data_empleado[0].id;
        d.querySelector('#status').selectedIndex = data_empleado[0].status;
    }else{
        limpiarformmulario();
    }

});

d.addEventListener('DOMContentLoaded', e => {
    extraer_data_empleados();
});

d.addEventListener('submit', e => {
    e.preventDefault();

    const cedula = e.target.cedula.value;
    const name = e.target.name.value;
    const lastname = e.target.lastname.value;
    const id = e.target.id.value; 
    const status = e.target.status.value;
    
    const form_data = new FormData();
    form_data.append('cedula', cedula);
    form_data.append('name', name);
    form_data.append('lastname', lastname);
    form_data.append('id', id);
    form_data.append('status', status);

    modificar_empleado(form_data);
})