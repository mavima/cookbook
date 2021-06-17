const changeAmounts = () => {

  const container = document.querySelector(".show-container");

  if(container) {

    const calculator = container.querySelector("#btn-calculator");
    let amountArray = Array.from(container.querySelectorAll(".dose-amount"));
    let portions_slot = container.querySelector(".portions_number_original");
    let portions_number = container.querySelector(".portions_number_original").innerHTML;
    let amounts = [];
    for(var i = 0; i < amountArray.length; i++) {
      amounts.push(parseInt(amountArray[i].innerHTML))
    }
    // get amount per portion from the original recipe
    let amountsPerPortion = [];
    amounts.forEach((amount) => {
        amountsPerPortion.push(amount / portions_number);
    });







      calculator.addEventListener('click', (event) => {
        let newPortions = document.getElementById("rations").value;
        event.preventDefault();
        if(newPortions) {
        amountsPerPortion.forEach((amountPerPortion, index) => {
          // count new amounts according to new ration number
          let newAmount = (amountPerPortion * newPortions).toFixed(1);
          amountArray[index].innerHTML = newAmount;
        });
        // replace the portion number in recipe
        portions_slot.innerHTML = newPortions;
        }

      });

  }
}

export { changeAmounts }
