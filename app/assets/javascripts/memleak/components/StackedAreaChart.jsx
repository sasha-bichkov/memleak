import { AreaChart, Area, XAxis, YAxis, CartesianGrid, Tooltip } from 'recharts';


export default class StackedAreaChart extends React.Component {
  render () {
    const { data, area_1, area_2 } = this.props;

    return (
      <AreaChart
        width={500}
        height={400}
        data={data}
        margin={{top: 10, right: 30, left: 0, bottom: 0}}
      >
        <XAxis dataKey="name"/>
        <YAxis/>
        <CartesianGrid strokeDasharray="3 3"/>
        <Tooltip/>
        <Area type='monotone' dataKey={area_1} stackId="1" stroke='#ff0000' fill='#ff0000' />
        <Area type='monotone' dataKey={area_2} stackId="1" stroke='#0000ff' fill='#0000ff' />
      </AreaChart>
    );
  }
}
