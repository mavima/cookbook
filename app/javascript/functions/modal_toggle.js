const modalToggle = () => {

  $('#show-modal-btn').on('click', (e) => {
      $('.show-mail-modal').show()
  })

  $('.comment-click').click(function() {
    $(this).next('.comment-modal').show()
  })

  $('.close-modal-btn').on('click', (e) => {
    $('.show-mail-modal').hide()
    $('.comment-modal').hide()
  })


}



export { modalToggle }
