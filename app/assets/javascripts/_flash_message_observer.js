$(function() {
  $(document).ajaxComplete(function(event, request) {
    if (request.getResponseHeader('X-Flash-Message-Present')) {

      var types = ['Error', 'Warning', 'Notice', 'Success'];

      $.each(types, function( index, value ) {
        var msg = request.getResponseHeader('X-Flash-Message-' + value);

        if (msg) {
          msg = '<div class="flash-' +
            value.toLowerCase() +
            '"><span>' +
            msg +
            '</span></div>';

          $('#flash_messages_container').prepend(msg);
        }
      });
    }
  });
});
