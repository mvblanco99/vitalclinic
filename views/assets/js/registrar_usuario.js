import app from './api.js';
import utilidades from "./utilidades.js";
const d = document,
$empleado = d.querySelector("#empleado"),
$role = d.querySelector("#role");

const { asignar_valores_select } = utilidades();

const mostrar_roles = (data_roles) => {

    asignar_valores_select(
        { 
            data: data_roles,
            titulo: "Seleccionar Rol",
            input: $role,
            nombre_opciones : {
                id : "id",
                nombre: "role"  
            }
        }
    );
}

const mostrar_empleados = (data_empleados) => {
    //Mostramos los datos de las categorias

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
        const data_empleados = await app('./controllers/users/empleados.php?extraer_empleados=1');
        console.log(data_empleados);
        mostrar_empleados(data_empleados)
    } catch (error) {
        console.log(error)
    }
};


const extraer_roles = async() => {
    try {
        const data_roles = await app('./controllers/users/empleados.php?extraer_roles=1');
        mostrar_roles(data_roles);
    } catch (error) {
        console.log(error)
    }
}

const registrar_usuario = async(form_data) => {
    try {
        const res = await app('./controllers/users/empleados.php?registrar_usuario=1','POST', form_data);
        console.log(res)
      } catch (error) {
        console.log(error)
      }
};  
 
d.addEventListener('DOMContentLoaded', e => {
    extraer_data_empleados();
    extraer_roles();
});

d.addEventListener('submit', e => {
    e.preventDefault();

    const empleado = e.target.empleado.value;
    const username = e.target.username.value;
    const password = e.target.password.value;
    const role = e.target.role.value;

    //Validar Informacion

    const formData = new FormData();
    formData.append('empleado', empleado);
    formData.append('username', username);
    formData.append('password', password);
    formData.append('role', role);

    registrar_usuario(formData);
});