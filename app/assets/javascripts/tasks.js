// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function bindTaskComplete(candidate) {
  $('input.task-status', candidate).click(function () {
    $button = $(this);

    if ($('.status-notice', candidate).length > 0) {
      dismiss($('.status-notice', candidate)[0]);
    }

    $.post($button.data('path'), function (data) {
      $statusToggleBlock = $button.closest('.status');
      $statusToggleBlock.html(data);
      bindTaskComplete($statusToggleBlock);
    });
  });
}

$(function() {
  bindTaskComplete('section.task');
});
