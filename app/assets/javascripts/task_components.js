// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function loadTaskComponentForm(href, scope) {
  $(scope).load(href, function () {
    bindTaskComponentTypeSelect(scope);
    $('.task-component-type-link').first().click();
  });
}

function bindTaskComponentTypeSelect(scope) {
  $('.task-component-type-link', scope).click(function (event) {
    $('.task-component-type-link').removeClass('selected');
    event.preventDefault();
    $(this).addClass('selected');

    $formContainer = $('.task-component-form-container', $(this).closest('.add-task-component'));
    $formContainer.load($(this).data('path'), function () {
      $('textarea, input:visible', this).first().focus();
    });
  });
}
