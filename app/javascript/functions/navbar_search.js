const nav_search_display = () => {
  $(document).ready(() => {
      $('.nav-search-form').hide();
    });
  $('.nav-search-img, .dropdown-toggle').on('click', (event) => {
    $(event.currentTarget).next('.nav-search-form, .dropdown-menu').toggle();
    });


//     document.addEventListener('click', (event) => {
//       let target = $(event.target);
//       if($(event.target).closest('.nav-search-form-wide').length === 0 && $(event.target).closest('.nav-search-wide').length === 0  &&
//         $('.nav-search-form-wide').is(':visible')){
//             $('.nav-search-form-wide').hide();
//   };
// });
}

export { nav_search_display }
