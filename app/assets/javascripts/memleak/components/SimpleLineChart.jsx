import { LineChart, Line, XAxis, Tooltip, YAxis, CartesianGrid, Legend } from 'recharts';


export default class SimpleLineChart extends React.Component {
  render () {
    const { data } = this.props;

    return (
      <LineChart
        width={500}
        height={300}
        margin={{top: 5, right: 30, left: 20, bottom: 5}}
        data={data}
      >
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
}
