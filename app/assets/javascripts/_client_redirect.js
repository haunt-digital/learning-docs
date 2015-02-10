function appendFlashMessage(msg, type) {
  if (msg) {
    msg = '<div class="flash-' +
      type +
      '"><span>' +
      msg +
      '</span></div>';

    $('.flash-messages-container').prepend(msg);
    bindDismissables('.flash-messages-container > *');
  }
}


$(function() {
  $(document).ajaxComplete(function(event, request) {
    if (request.getResponseHeader('X-Redirect-Requested')) {
      var redirectPath = request.getResponseHeader('X-Redirect-Path');
      setTimeout(function () {
        window.location.href = redirectPath;
      }, 800);
    }
  });
});
