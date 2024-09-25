import app from '../api.js';
const d = document;

const registrar_ruta = async(form_data) => {
    try {
        const res = await app('./controllers/almacen/rutas.php?registrar_ruta=1','POST', form_data);
        console.log(res)
    } catch (error) {
        console.log(error)
    }
};

d.addEventListener('submit', e => {
    e.preventDefault();

    const ruta = e.target.ruta.value;

    //Validar Informacion

    const formData = new FormData();
    formData.append('ruta', ruta);
    registrar_ruta(formData);
});