function refresh(selector, path) {
  path = path || location.pathname;
  $(selector).load(
    path + ' ' + selector + ' > *'
  );
}
