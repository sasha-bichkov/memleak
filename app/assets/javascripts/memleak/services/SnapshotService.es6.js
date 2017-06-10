import axios from 'axios'


export default class SnapshotService {

  static getSnapshots(callback) {
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

      callback(data)
    })
  }

}
