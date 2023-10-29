const modal = document.querySelector(".modal-login");
const loginBtn = document.querySelector(".login");
const imgLogin = loginBtn.querySelector("img");
const entrarBtn = modal.querySelector("#entrar");
const inputs = document.querySelectorAll(".modal-inputs input")


function setAdm(){
    console.log("login de adm");
        
     window.location.href = "./admPage.jsp"
}



function validateLogin(loginForm){
    const {usuario,senha} = loginForm;
    if(usuario === "adm" && senha === "adm"){
        setAdm();
    } else{
        console.log("login invalido");
    }
}



function handleLogin(e){
    e.preventDefault();
    const loginForm = {
        usuario: inputs[0].value,
        senha: inputs[1].value
    };
    
    validateLogin(loginForm);
}


function handleClick() { 
    modal.classList.toggle("active");
};


loginBtn.addEventListener("click", handleClick);
entrarBtn.addEventListener("click",handleLogin)

