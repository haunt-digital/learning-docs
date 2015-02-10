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
