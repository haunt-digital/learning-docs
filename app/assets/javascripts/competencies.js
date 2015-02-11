// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function bindSkillCardLinks() {
  $('.skills > .skill-card').click(function () {
    location.href = $(this).data('path');
  });
}

function bindCompetencySubscribe(candidate) {
  $('input.competency-subscribe', candidate).click(function () {
    $button = $(this);

    $.post($button.data('path'), function (data) {
      $statusToggleBlock = $button.closest('.subscribe');
      $statusToggleBlock.html(data);
      bindCompetencySubscribe($statusToggleBlock);
    });
  });
}

$(function() {
  bindSkillCardLinks();
  bindCompetencySubscribe('section.competency');
});
