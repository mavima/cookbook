const slideMenu = () => {
  console.log("sliding baby!")

  // const panel = document.querySelector('.panel')
  // const menu = document.getElementById('menu')
  // const overlay = `<div id="panel_overlay" style="background-color: rgba(0, 0, 0, 0.7); z-index: 1000; position: absolute; height: 100%; width: 100%"> </div>`

  $('#openSlideOut').on('click', (e) => {
    if ($('.panel').hasClass("slideout-open")) {
      console.log("slide up!")
      $('.panel').removeClass("slideout-open visible");

    // $('.panel').slideUp()
  }
    // //   $('.panel').addClass("hidden")
    else {
      console.log("slide down");
      // $('.panel').slideDown()
    $('.panel').addClass("slideout-open visible");

    }
  })

}


export { slideMenu }






// import './slideout.min.js';


// const slideout = new Slideout({
//   'panel': document.getElementById('panel'),
//   'menu': document.getElementById('menu'),
//   'padding': 256,
//   'tolerance': 70,
//   'touch': false
// });

// const panel = document.getElementById('panel')
// const overlay = `<div id="panel_overlay" style="background-color: rgba(0, 0, 0, 0.7); z-index: 1000; position: absolute; height: 100%; width: 100%"> </div>`

// document.getElementById('openSlideOut').addEventListener('click', (e) => {
//   if (slideout._opened)
//     {
//       slideout.close();
//       const overlayElement = document.getElementById("panel_overlay")
//       if(overlayElement)
//       {
//         overlayElement.remove();
//       }
//     }
//   else
//   {
//     slideout.open()
//     panel.insertAdjacentHTML('afterBegin', overlay);

//   }
// })

// document.getElementById('panel').addEventListener('click', (e) => {
//   slideout.close()
//   const overlayElement = document.getElementById("panel_overlay")
//   if(overlayElement)
//   {
//     overlayElement.remove();
//   }
// })



