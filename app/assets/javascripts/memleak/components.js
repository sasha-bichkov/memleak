require( 'babel-polyfill' );

global.Utils = require('./utils.es6.js').default;
global.SimpleLineChart = require('./components/SimpleLineChart.jsx').default;
global.StackedAreaChart = require('./components/StackedAreaChart.jsx').default;