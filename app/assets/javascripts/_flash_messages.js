function parseResponseHeaders(headerStr) {
  var headers = {};
  if (!headerStr) {
    return headers;
  }
  var headerPairs = headerStr.split('\u000d\u000a');
  for (var i = 0; i < headerPairs.length; i++) {
    var headerPair = headerPairs[i];
    // Can't use split() here because it does the wrong thing
    // if the header value has the string ": " in it.
    var index = headerPair.indexOf('\u003a\u0020');
    if (index > 0) {
      var key = headerPair.substring(0, index);
      var val = headerPair.substring(index + 2);
      headers[key] = val;
    }
  }
  return headers;
}

function appendFlashMessage(msg, type) {
  if (msg) {
    msg = '<div class="flash-message flash-' +
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
  $(document).ajaxComplete(function(event, response) {
    if (response.getResponseHeader('X-Flash-Present')) {
      var headers = response.getAllResponseHeaders();
      headers = parseResponseHeaders(headers);

      var i = 0;

      $.each(headers, function( index, value ) {
        i++;

        if (index.match("^X-Flash-Message-[^Present]")) {

          var msg = response.getResponseHeader(index);
          var type = index.split('X-Flash-Message-')[1]
          var type = type.split('--')[0];

          setTimeout(function () {
            appendFlashMessage(msg, type.toLowerCase());
          }, i*20);
        }
      });
    }
  });
});
