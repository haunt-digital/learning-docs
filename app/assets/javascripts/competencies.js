// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function bindSkillCardLinks() {
  $('.skills > .skill-card').click(function () {
    location.href = $(this).data('path');
  });
}

function bindCompetencySubscribe(candidate) {
  $('input.unsubscribed', candidate).click(function () {
    $button = $(this);

    $.post($button.data('path'), function (data) {
      $responseBlock = $('.status', candidate);
      $responseBlock.html(data);

      refresh('.subscribe');

      bindCompetencyUnsubscribe(candidate);
    });
  });
}

function bindCompetencyUnsubscribe(candidate) {
  $('input.subscribed', candidate).click(function () {
    $button = $(this);

    $.post($button.data('path'), function (data) {
      $responseBlock = $('.subscribe', candidate);
      $responseBlock.html(data);

      refresh('.status');

      bindCompetencySubscribe(candidate);
    });
  });
}

function bindCompetencyView(candidate) {
  $('input.competency-view', candidate).click(function () {
    window.location = $(this).data('path');
  });
}

$(function() {
  bindSkillCardLinks();
  bindCompetencySubscribe('section.competency');
  bindCompetencyUnsubscribe('section.competency');
  bindCompetencyView('section.competency');
});
