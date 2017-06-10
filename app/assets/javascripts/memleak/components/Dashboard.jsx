export default class Dashboard extends React.Component {

  constructor() {
    super()

    this.state = {
      data: []
    }
  }

  componentDidMount() {
    SnapshotService.getSnapshots((data) => {
      this.setState({data: data})
    })
  }

  render () {
    return (
      <StackedAreaChart data={this.state.data} area_1={'total_allocated_memsize'} area_2={'total_retained_memsize'} />
      //
    )
  }
}
