const fadeOut = () => {
  $(document).ready(function(){
    setTimeout(function() {
      $('.alert').fadeOut('slow', function() {
        $(this).remove();
      });
    }, 3000);
    // setTimeout(function() {
    //   $('.alert-wrapper').fadeOut('slow', function() {
    //     $(this).remove();
    //   });
    // }, 5000);
  });
}

export { fadeOut }
