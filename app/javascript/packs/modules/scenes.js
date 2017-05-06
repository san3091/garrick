import axios from 'axios'

export const nextLine = (current) => {
  let _current = current < 0 ? 0 : current

  let params = {
    method: 'get',
    url: `/lines/${_current + 1}`,
    withCredentials: true,
    headers: {
      'Accept': 'application/json',
      'X-CSRF-Token': getCSRFToken()
    }
  }

  return axios(params)
}

function getCSRFToken() {
  const meta = document.getElementsByName('csrf-token')
  if (meta.length === 1) {
    return meta[0].getAttribute('content')
  }
}