$(document).ready( function () {

  $(".product-row").click( function (e) {
    window.location.href = '/products/' + e.currentTarget.children[0].children[0].value
  })

})
