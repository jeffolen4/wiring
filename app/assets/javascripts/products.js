$(document).ready( function () {

  $(".product-row").click( function (e) {
    window.location.href = '/products/' + e.currentTarget.children[0].children[0].value
  })

  $("#dropdown-apps > li").click( function (e) {
    $("#dropdownApps")[0].innerHTML = e.target.attributes.value.value + "&nbsp;<span class=\"caret\"></span>";
    $('input[name*=selected_app]')[0].value = e.target.attributes.value.value;
    document.getElementById("index-form").submit();
  })

  $("#dropdown-awg > li").click( function (e) {
    $("#dropdownGauge")[0].innerHTML = e.target.attributes.value.value + "&nbsp;<span class=\"caret\"></span>";
    $('input[name*=selected_awg]')[0].value = e.target.attributes.value.value;
    document.getElementById("index-form").submit();
  })

})
