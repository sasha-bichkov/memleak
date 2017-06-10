import axios from 'axios'

export default class Dashboard extends React.Component {

  constructor() {
    super()

    this.state = {
      data: []
    }
  }

  componentDidMount() {
    const request = axios.get(`/memleak/snapshots/${location.search}`)

    request.then((response) => {
      const snapshots = response.data;
      const data = snapshots.map((snapshot, index) => {
        return {
          id: index + 1,
          total_allocated_memsize: Utils.bytes_to_megabytes(snapshot.total_allocated_memsize),
          total_retained_memsize: Utils.bytes_to_megabytes(snapshot.total_retained_memsize)
        }
      })

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
