const reviewStars = () => {
  const input = document.querySelector("#review_rating")
  if (input)
  {
    const stars = document.querySelectorAll("#star_rating")
    const emptyStars = (stars) => {
      stars.forEach((star) => {
        star.classList.add("empty")
      })
    }

    const fillStars = (stars, number) => {
      let x = 0
      emptyStars(stars);
      stars.forEach((star) => {
        if (x == number)
        {
          return
        }
        star.classList.remove("empty")
        star.classList.add("checked")
        x++;
      })
    }

    emptyStars(stars);

    stars.forEach((star) => {
      star.addEventListener("click", () => {
        console.log(star.dataset.value)
        input.value = star.dataset.value
        fillStars(stars, star.dataset.value)
      })
    })
  }
}


export { reviewStars }
