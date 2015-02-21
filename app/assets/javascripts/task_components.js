// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function loadTaskComponentForm() {
  $('.add-task-component-container').load(href, function () {
    bindTaskComponentTypeSelect();
    $('.task-component-type-link').first().click();
  });
}

function bindTaskComponentTypeSelect() {
  $('.task-component-type-link').click(function (event) {
    event.preventDefault();

    $('.task-component-form-container').load(this.href, function () {

    });
  });
}
