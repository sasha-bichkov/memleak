//= require react
//= require react_ujs
//= require_tree ./components

document.addEventListener('DOMContentLoaded', function() {
  console.log('bla-bla');
  ReactDOM.render(<TestComponent />, document.getElementById('memleak'));
});
