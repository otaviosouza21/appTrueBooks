const modal = document.querySelector(".modal-login");
const loginBtn = document.querySelector(".login");
const imgLogin = loginBtn.querySelector("img");

function handleClick() { 
    modal.classList.toggle("active");

 
};

loginBtn.addEventListener("click", handleClick);


