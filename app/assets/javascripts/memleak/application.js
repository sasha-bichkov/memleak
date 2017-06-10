//= require react
//= require react_ujs

require('./components')

document.addEventListener('DOMContentLoaded', function() {
  const chart = document.getElementById('chart')
  ReactDOM.render(<Dashboard />, chart)
})
