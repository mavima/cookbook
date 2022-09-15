const nav_search_display = () => {
  $(document).ready(() => {
      $('.nav-search-form').hide();
    });
  $('.nav-search-img').on('click', (event) => {
    $(event.currentTarget).next('.nav-search-form').toggle();
    });
}

const nav_profile_display = () => {
  $(document).ready(() => {
      $('.dropdown-menu').hide();
    });
    $('#dropdown-menu-button').on('click', (event) => {
    $('.dropdown-menu').toggle();
  });
}


export { nav_search_display }
export { nav_profile_display }

