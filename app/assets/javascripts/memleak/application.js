//= require react
//= require react_ujs

require('./components');

import axios from 'axios';

document.addEventListener('DOMContentLoaded', function() {

  const utils = new Utils();
  const request = axios.get(`/memleak/snapshots/${location.search}`);

  request.then((response) => {
    let snapshots = response.data;
    let data = snapshots.map((snapshot, index) => {
      return {
        id: index + 1,
        total_allocated_memsize: utils.bytes_to_megabytes(snapshot.total_allocated_memsize),
        total_retained_memsize: utils.bytes_to_megabytes(snapshot.total_retained_mem''size)
      }
    });

    const chart = document.getElementById('chart');
    ReactDOM.render(<StackedAreaChart data={data} area_1={'total_allocated_memsize'} area_2={'total_retained_memsize'} />, chart);
  });
});
