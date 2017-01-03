//= require react
//= require react_ujs
//= require ./libs/axios

//= require_tree ./components

document.addEventListener('DOMContentLoaded', function() {

  const { LineChart, Line, XAxis, Tooltip, YAxis, CartesianGrid, Legend } = Recharts;

  const request = axios.get(`snapshots/${location.search}`);

  request.then((response) => {
    let snapshots = response.data;
    let data = snapshots.map((snapshot, index) => {
      return {
        id: index + 1,
        total_allocated_memsize: bytes_to_megabytes(snapshot.total_allocated_memsize),
        total_retained_memsize: bytes_to_megabytes(snapshot.total_retained_memsize)
      }
    });

    const SimpleLineChart = React.createClass({
      render () {
        return (
          <LineChart width={1200} height={600} data={data}
                margin={{top: 5, right: 30, left: 20, bottom: 5}}>
             <XAxis dataKey="id"/>
             <YAxis/>
             <CartesianGrid strokeDasharray="3 3"/>
             <Legend />
             <Tooltip />
             <Line type="monotone" dataKey="total_allocated_memsize" stroke="#ff0000" />
             <Line type="monotone" dataKey="total_retained_memsize" stroke="#0000ff" />
          </LineChart>
        );
      }
    });

    chart = document.getElementById('chart');
    ReactDOM.render(<SimpleLineChart />, chart);
  });
});

const bytes_to_megabytes = (size) => {
  return size / 1024 / 1024;
}