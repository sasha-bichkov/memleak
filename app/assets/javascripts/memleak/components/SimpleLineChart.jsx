import { LineChart, Line, XAxis, Tooltip, YAxis, CartesianGrid, Legend } from 'recharts';


export default class SimpleLineChart extends React.Component {
  render () {
    const { data, line_1, line_2 } = this.props;

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
         <Line type="monotone" dataKey={line_1} stroke="#ff0000" />
         <Line type="monotone" dataKey={line_2} stroke="#0000ff" />
      </LineChart>
    );
  }
}
