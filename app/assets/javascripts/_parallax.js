$(document).ready(function() {
  if ($(".parallax-window").length) {
    parallax();
  }
});

$(window).scroll(function(e) {
  if ($(".parallax-window").length) {
    parallax();
  }
});

function parallax(){
  if( $(".parallax-window").length > 0 ) {
    var plxBackground = $(".parallax-background");
    var plxWindow = $(".parallax-window");

    var plxWindowTopToPageTop = $(plxWindow).offset().top;
    var windowTopToPageTop = $(window).scrollTop();
    var plxWindowTopToWindowTop = plxWindowTopToPageTop - windowTopToPageTop;

    var plxBackgroundTopToPageTop = $(plxBackground).offset().top;
    var windowInnerHeight = window.innerHeight;
    var plxBackgroundTopToWindowTop = plxBackgroundTopToPageTop - windowTopToPageTop;
    var plxBackgroundTopToWindowBottom = windowInnerHeight - plxBackgroundTopToWindowTop;
    var plxSpeed = 0.90;

    plxBackground.css('top', - (plxWindowTopToWindowTop * plxSpeed) + 'px');
  }
}
