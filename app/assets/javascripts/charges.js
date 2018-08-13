$(document).ready(() => {
  $('.js-charge-click').on('click', (e) => {
    const chargeId = $(e.currentTarget).data('id')
    const modal = $('.js-charge-modal[data-id="' + chargeId + '"]')[0]

    $(modal).modal('toggle')
  })
})
