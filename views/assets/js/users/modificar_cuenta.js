import app from '../api.js';
import utilidades from "../utilidades.js";
const d = document,
$account = d.querySelector("#account"),
$role = d.querySelector("#role");

let data_accounts = [];

const { asignar_valores_select } = utilidades();

const mostrar_accounts = (data_accounts) => {
    //Mostramos los datos de los empleados

    const format_data = data_accounts.map( e => {
       const data = {
        id: e.id_account,     
        nombre: `${e.username}`
       }

       return {...data}
    })

    asignar_valores_select(
        { 
            data: format_data,
            titulo: "Seleccionar Cuenta",
            input: $account,
            nombre_opciones : {
                id : "id",
                nombre: "nombre"  
            }
        }
    );
};

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


const extraer_data_accounts = async () => {
    try {
        data_accounts = await app('./controllers/users/empleados.php?extraer_accounts=1');
        mostrar_accounts(data_accounts)
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

$account.addEventListener('change', e => {
    if($account.value !== ""){
        const id_account = $account.value;
        const data_account = data_accounts.filter(i => i.id_account === id_account);

        console.log(data_account)

        d.querySelector('#username').value = data_account[0].username;
        d.querySelector('#password').value = data_account[0].password;
        d.querySelector('#id').value = data_account[0].id;
        d.querySelector('#role').selectedIndex = data_account[0].role_id;
        d.querySelector('#status').selectedIndex = data_account[0].status;
    }else{
        limpiarformmulario();
    }

});

d.addEventListener('DOMContentLoaded', e=> {
    extraer_data_accounts();
    extraer_roles();
})