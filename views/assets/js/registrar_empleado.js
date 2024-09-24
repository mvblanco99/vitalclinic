import app from "./api.js";

const d = document;

const limpiar_formulario = () => {
  d.querySelector('#name').value = "";
  d.querySelector('#lastname').value = "";
  d.querySelector('#cedula').value = "";
}

const registrar_empleado = async(form_data) => {
  try {
    const res = await app('./controllers/empleados.php?registrar_empleado=1','POST', form_data);
    if(res){
      limpiar_formulario();
    }
  } catch (error) {
    console.log(error)
  }
}

d.addEventListener('submit', e => {
  e.preventDefault();

  const name = e.target.name.value;
  const lastname = e.target.lastname.value;
  const cedula = e.target.cedula.value;

  //Validar Datos
  
  const formData = new FormData();
  formData.append('name', name);
  formData.append('lastname',lastname);
  formData.append('cedula', cedula);

  registrar_empleado(formData);
});