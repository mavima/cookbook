const delete_confirmation = () => {
    const trash = document.querySelectorAll(".deleting")
    const confirmation = document.querySelector(".delete-confirmation")
    const cancel = document.querySelectorAll(".btn-cancel")
    console.log(cancel)
    console.log(trash)
    // if(trash) {
    //     trash.addEventListener('click', () => {
    //         confirmation.classList.add("visible-confirmation");
    //     })
    // }

    // if(cancel) {
    //     cancel.addEventListener('click', () => {
    //         confirmation.classList.remove("visible-confirmation");
    //     })    
    // }
    
}

export { delete_confirmation }