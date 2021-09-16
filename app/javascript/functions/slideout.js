const slideMenu = () => {
  console.log("sliding baby!")

  // const panel = document.querySelector('.panel')
  // const menu = document.getElementById('menu')
  // const overlay = `<div id="panel_overlay" style="background-color: rgba(0, 0, 0, 0.7); z-index: 1000; position: absolute; height: 100%; width: 100%"> </div>`

  $('#openSlideOut').on('click', (e) => {
    if ($('.panel').hasClass("slideout-open")) {
      console.log("slide up!")
      $('.panel').removeClass("slideout-open visible");
      $('.pages').removeClass("layout");
  }
    else {
    $('.panel').addClass("slideout-open visible");
    $('.pages').addClass("layout");
    }
  })

}

export { slideMenu }


