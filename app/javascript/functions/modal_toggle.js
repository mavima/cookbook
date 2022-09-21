const modalToggle = () => {

  $('#show-modal-btn').on('click', (e) => {
      $('.show-mail-modal').show()
  })

  $('.comment-click').click(function() {
    $(this).next('.comment-modal').show()
  })

  $('.delete-review-click').click(function() {
    $(this).next('.delete-confirmation-modal').show()
  })

  $('.delete-link-click').click(function() {
    console.log('click')
    console.log(this)
    $(this).next('.delete-link-confirmation-modal').show()
  })


  $('.close-modal-btn').on('click', (e) => {
    $('.show-mail-modal').hide()
    $('.comment-modal').hide()
    $('.delete-confirmation-modal').hide()
  })


}



export { modalToggle }
