function dismiss(elm, dismissClass) {
  dismissClass = dismissClass || 'dismiss';
  $(elm).addClass('dismiss').on(
    'animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', function(e) {
      $(this).remove();
    });
}

function bindDismissables(selector) {
  selector = selector || '.dismissable';
  $(selector).not('*[data-bound-dismiss]').each(function () {
    $(this).data('bound-dismiss', true);
    $(this).click(function () {
      dismiss(this);
    });

    var that = this;

    setTimeout(function () {
      dismiss(that);
    }, 3000);
  });
}
