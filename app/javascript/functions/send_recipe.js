const sendRecipe = () => {
    const email_btn = document.querySelector("#btn-email");
    email_btn.addEventListener('click', () => {
        console.log("You got mail!")
    })

}

export { sendRecipe };

