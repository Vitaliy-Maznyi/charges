$(document).ready(() => {
  $('.alert').delay(3000).fadeOut('slow', function() {
    $(this).removeClass('show');
  });
})
