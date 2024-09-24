import app from './api.js';
const d = document;

const mostrar_error_login = () => {
    d.querySelector('#error-login').classList.remove('hidden');
} 

const login = async(form_data) => {
    try {
        const data = await app('./controllers/auth.php?auth=1','POST',form_data);
        if(data.length > 0){
            //Redirigimos al inicio 
            window.location = "inicio"
        }else{
            mostrar_error_login();
        }
        
    } catch (error) {
        console.log(error)
    }
}

d.addEventListener('submit', e => {
    e.preventDefault();

    const username = e.target.username.value;
    const password = e.target.password.value;

    const formdata = new FormData();
    formdata.append('username', username);
    formdata.append('password', password);

    login(formdata);
});