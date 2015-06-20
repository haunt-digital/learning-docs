// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function toggleCompletedRibbon() {
  if ($('.task .ribbon-wrapper').length > 0) {
    $('.task .ribbon-wrapper').toggle();
  }
}

function toggleProgressListStatus() {
  var $current = $("li[data-current='true']");

  if ($current.attr('data-complete') == 'true') {
    $current.attr('data-complete', 'false');
  }
  else {
    $current.attr('data-complete', 'true');
  }
}

function bindTaskComplete(candidate) {
  $('input.task-status', candidate).click(function () {
    $button = $(this);

    if ($('.status-notice', candidate).length > 0) {
      dismiss($('.status-notice', candidate)[0]);
    }

    toggleCompletedRibbon();
    toggleProgressListStatus();

    $.post($button.data('path'), function (data) {
      $statusToggleBlock = $button.closest('.status');
      $statusToggleBlock.html(data);
      bindTaskComplete($statusToggleBlock);
    });
  });
}

function bindSkillProgressLinks() {
  $('.skill-progress-breadcrumbs li').click(function () {
    location.href = $(this).data('path');
  });
}


$(function() {
  bindTaskComplete('section.task');
  bindSkillProgressLinks();
});
