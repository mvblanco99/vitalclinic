import app from '../api.js';
import utilidades from "../utilidades.js";
const { asignar_valores_select } = utilidades();
const d = document,
$motivo = d.querySelector('#motivo');

const mostrar_motivos = (data_motivos) => {
    asignar_valores_select({ 
        data: data_motivos,
        titulo: "Seleccionar Motivo",
        input: $motivo,
        nombre_opciones : {
            id : "id",
            nombre: "descripcion"  
        }
    })
}

const registrar_fallas = async(form_data) => {
    try {
        const data = await app('./controllers/almacen/fallas_pedidos.php?registrar_fallas=1','POST',form_data);
        console.log(data)
        if(!data){
            alert('Ha proporcionado un codigo de pedido incorrecto')
        }
    } catch (error) {
        console.log(error)
    }
}

const extraer_data_motivo_fallas = async () => {
    try {
        const data_motivo_fallas = await app('./controllers/almacen/fallas_pedidos.php?extraer_motivos=1');
        mostrar_motivos(data_motivo_fallas)
    } catch (error) {
        console.log(error)
    }
};


d.addEventListener('DOMContentLoaded', e => {
    extraer_data_motivo_fallas();
});


d.addEventListener('submit', e=>{
    e.preventDefault();

    const num_pedido = e.target.cod_pedido.value;
    const descripcion = e.target.descripcion.value;
    const motivo = e.target.motivo.value;

    const formdata = new FormData();
    formdata.append('num_pedido', num_pedido);
    formdata.append('descripcion', descripcion);
    formdata.append('motivo', motivo);

    registrar_fallas(formdata);
})