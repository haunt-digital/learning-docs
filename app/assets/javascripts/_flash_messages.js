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
  bindDismissables('.flash-messages-container > *');

  // Set up observer for header messages.
  $(document).ajaxComplete(function(event, request) {
    if (request.getResponseHeader('X-Flash-Message-Present')) {

      var types = ['Error', 'Warning', 'Notice', 'Success', 'Task-Points', 'Skill-Points', 'Task-Complete', 'Skill-Complete'];

      $.each(types, function( index, value ) {
        var msg = request.getResponseHeader('X-Flash-Message-' + value);
        appendFlashMessage(msg, value.toLowerCase());
      });
    }
  });
});
