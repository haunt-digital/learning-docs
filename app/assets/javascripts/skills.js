// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function bindTaskCardLinks() {
  $('.tasks > .task-card').click(function () {
    location.href = $(this).data('path');
  });
}

$(function() {
  bindTaskCardLinks();
});
